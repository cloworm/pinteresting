$(function () {
  $("#mobile-side-nav .search.card").each(function () {
    var $searchCard = $(this);
    var $searchField = $searchCard.find("input[type=\"search\"]");

    $searchField.on("focus", function () {
      $searchCard.addClass("focused");
    });

    $searchField.on("blur", function () {
      $searchCard.removeClass("focused");
    });
  });
});
