jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()



jQuery ->
  $("#offer-image-list").sortable
    stop: ( event, ui ) ->
      $("#offer-image-list .thumbnail").removeClass("main")
      $("#offer-image-list .thumbnail").each (index, element) =>
        $(element).addClass("main") if index == 0
        $(element).children(".offer-image-position").val(index)