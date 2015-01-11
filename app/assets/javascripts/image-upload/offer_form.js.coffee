jQuery ->  
  $("#offer-image-list").sortable
    stop: ( event, ui ) ->
      $("#offer-image-list .thumbnail").removeClass("main")
      $("#offer-image-list .thumbnail").each (index, element) =>
        $(element).addClass("main") if index == 0
        $(element).children(".offer-image-position").val(index)
