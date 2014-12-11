jQuery ->  
  $("#event-card-list").sortable
    stop: ( event, ui ) ->
      $("#event-card-list .thumbnail").removeClass("main")
      $("#vendor-brand .thumbnail").each (index, element) =>
        $(element).addClass("main") if index == 0
        $(element).children(".event-card-position").val(index)
