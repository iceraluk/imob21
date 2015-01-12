module OffersHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields real-btn btn", style: "margin-left: 200px", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def main_image(offer_images, offer_image)
    if offer_image.position
      return "main" if offer_image.position == 0
    end
    return "main" if offer_image.id == offer_images.first.id
    return ""
  end

  def imaginea_principala_listare(offer)
    return offer.offer_images.order('position ASC').first.image_url(:listing) if offer.offer_images.order('position ASC').first && !offer.offer_images.order('position ASC').first.image_url.nil?
  end

  def imaginea_principala_post(offer)
    return offer.offer_images.order('position ASC').first.image_url(:post) if offer.offer_images.order('position ASC').first && !offer.offer_images.order('position ASC').first.image_url.nil?
  end

end
