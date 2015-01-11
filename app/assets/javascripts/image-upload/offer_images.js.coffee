jQuery ->
  imageEdtior = new ImageEdtior()
  window.ii = imageEdtior
  $("#offer-image-list .thumbnail").on 'click', (e) =>
    img = $(e.target)[0]
    src = $(e.target).attr('src')
    imageEdtior.launch img,src if src

  $("#offer-image-fileupload").fileupload
    add: (e, data) ->
      types = /(\.|\/)(gif|jpe?g|png)$/i
      file = data.files[0]
      if $("#offer-image-list .thumbnail:visible").length >= 5
        $(".s3-upload-errors").text("Sorry you can only have 5 images.")
      else if types.test(file.type) || types.test(file.name)
        # TODO: This needs to be deffered as its async for the time being it does nothing
        image_validator = new ImageValidator(file)
        data.context = $(tmpl("template-upload", file))
        $("#fileupload").append(data.context)
        $("#Content-Type").val(file.type)
        data.submit()
      else
        $(".s3-upload-errors").text("#{file.name} is not a gif, jpeg, or png image file")

    progress: (e, data) ->
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10)
        data.context.find(".bar").css("width", progress + "%")

    done: (e, data) ->
      file = data.files[0]
      s3_path = $("#offer-image-fileupload input[name=key]").val().replace("${filename}", UNorm.nfc(file.name))
      if ($('#create_button').length)
        $('#create_button').enable();


      # Create a new row if there is not an empty one available
      unless /\${filename}/.test($(".offer-image-key").last().val())
        new ElementCloner($(".thumbnail").last(),
                          $(".thumbnail").length)
        # remove the duplicated image tag
        $(".thumbnail").last().children("img").remove()

      # set the key for the S3 link
      $(".offer-image-key").last().val(s3_path)

      # show our new image and set its position

      image_tag = "<img id=\"cid-#{e.timeStamp}\" src='#{$("#offer-image-fileupload").attr("action")}#{s3_path}'/>"

      thumbnail_pos = $("#offer-image-list .thumbnail").length - 1

      $("#offer-image-list .thumbnail").last().append(image_tag);
      $("#offer-image-list .thumbnail .offer-image-position").val(thumbnail_pos)

    fail: (e, data) ->
      $(".s3-upload-errors").text("#{data.files[0].name} failed to upload.")

    stop: (e, data) ->
      # If starting from 0 images ensure one of them is set to main
      if $("#offer-image-list .thumbnail.main").length == 0
        $("#offer-image-list .thumbnail").first().addClass("main")
        $("#offer-image-list .thumbnail .offer-image-position").val(0)


  class ElementCloner
    constructor: (existing_element, @new_row_number) ->
      cloned_element = existing_element.clone()
      cloned_element.removeClass('main')

      #Remove hidden if previous element was deleted and make checkbox true
      cloned_element.removeClass('hidden')
      cloned_element.find(':checkbox').attr('checked', false);

      existing_element.after(cloned_element)
      cloned_element.children("input").each (index, element) =>
        @_update_field_attributes($(element))

    # update cloned element name and id
    _update_field_attributes: (element) ->
      element_name = element.attr("name")
      row = element_name.match(/\d+/);
      orginal_row_number = parseInt(row[0])

      element.attr("name", element_name.replace(orginal_row_number,
                                                @new_row_number))

      element.attr("id", element_name.replace(orginal_row_number,
                                              @new_row_number))

  class ImageValidator
    constructor: (file) ->
      @types = /(\.|\/)(gif|jpe?g|png)$/i
      @valid = false
      @valid = true if @types.test(file.type) || @types.test(file.name)
      @minWidth = 488
      @minHeight = 640
      reader = new FileReader()
      reader.onload = @validImageSize
      reader.readAsDataURL(file)
      return @
    
    validImageSize: (theFile) =>
      image = new Image();
      image.onload = @checkSize
      image.src = theFile.target.result;
      
    checkSize: (image) =>
      @valid = false if image.srcElement.width < @minWidth || image.srcElement.height < @minHeight