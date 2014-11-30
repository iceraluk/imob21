class @ImageEditor
  constructor: (args) ->
    @editor = new Aviary.Feather(
      apiKey: "<%= Imob21.config.awp_access_key_id %>"
      theme: "dark"
      onSave: (imageID, newURL) =>
        img = document.getElementById(imageID)
        img.src = newURL
        # Set the new url
        # $("#article_remote_avatar_url").val newURL
        @editor.close()
        return

      onError: (errorObj) ->
        alert errorObj.message
        return

      onReady: () ->
        console.log('ready')
    )
    return @

  launch: (id, src) ->
    @editor.launch
      image: id
      url: src
      forceCropPreset: ['iOS', '640x488']
      forceCropMessage: 'Crop your Cover Image:'
    false