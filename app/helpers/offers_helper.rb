module OffersHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def s3_uploader_form(options = {}, &block)
    uploader = S3Uploader.new(options)
    form_tag(uploader.url, uploader.form_options) do
      uploader.fields.map do |name, value|
        hidden_field_tag(name, value)
      end.join.html_safe + capture(&block)
    end
  end

end

class S3Uploader
  def initialize(options)
    @options = options.reverse_merge(
        id: "offer-image-fileupload",
        aws_access_key_id: CarrierWave::Uploader::Base.fog_credentials[:aws_access_key_id],
        aws_secret_access_key: CarrierWave::Uploader::Base.fog_credentials[:aws_secret_access_key],
        bucket: CarrierWave::Uploader::Base.fog_directory,
        acl: "public-read",
        expiration: 10.hours.from_now,
        max_file_size: 500.megabytes,
        as: "file"
    )
  end

  def form_options
    {
        id: @options[:id],
        method: "post",
        authenticity_token: false,
        multipart: true,
        data: {
            post: @options[:post],
            as: @options[:as]
        }
    }
  end

  def fields
    {
        :key => key,
        "Content-Type" => ""
        # :acl => @options[:acl],
        # :policy => policy,
        # :signature => signature,
        # "AWSAccessKeyId" => @options[:aws_access_key_id],
    }
  end

  def key
    @key ||= "uploads/offer_images/previews/#{SecureRandom.hex}/${filename}"
  end

  def url
    "http://#{@options[:bucket]}.s3.amazonaws.com/"
  end

  def policy
    Base64.encode64(policy_data.to_json).gsub("\n", "")
  end

  def policy_data
    {
        expiration: @options[:expiration],
        conditions: [
            ["starts-with", "$utf8", ""],
            ["starts-with", "$key", ""],
            ["content-length-range", 0, @options[:max_file_size]],
            {bucket: @options[:bucket]},
            {acl: @options[:acl]}
        ]
    }
  end

  def signature
    Base64.encode64(
        OpenSSL::HMAC.digest(
            OpenSSL::Digest::Digest.new('sha1'),
            @options[:aws_secret_access_key], policy
        )
    ).gsub("\n", "")
  end
end

