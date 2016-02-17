$(function() {
  var $body = $("body")
    , $window = $(window);

  $(document).on("change", "form.auto-submit input[type=\"file\"]", function (_event) {
    $(this).closest("form").submit();
    // TODO: loading spinner on submit.
  });

  var toggleDragOver = function (event) {
    var isDraggingInsideScreen
      , mouseX = event.clientX
      , mouseY = event.clientY
      , windowWidth = $window.innerWidth()
      , windowHeight = $window.innerHeight();

    isDraggingInsideScreen =
      mouseX > 0 &&
      mouseY > 0 &&
      mouseX < windowWidth &&
      mouseY < windowHeight
      ;

    $body.toggleClass("drag-over", isDraggingInsideScreen);
  }

  $(document).on("dragstart dragenter dragover drag", "*", toggleDragOver);
  $(document).on("dragleave dragend", "*", toggleDragOver);
  $(document).on("drop", "*", function (_event) {
    $body.removeClass("drag-over");
  });
});
