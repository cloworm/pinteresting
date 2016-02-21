$(function () {
  $(".input-field.clearable-input-field").each(function () {
    var $container = $(this);
    var $inputElement = $container.find("input");
    var $clearButton = $container.find(".clear-button");

    $clearButton.on("click", function () {
      $inputElement.val("");
    });
  });
});
