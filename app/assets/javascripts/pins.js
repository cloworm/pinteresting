var masonryIsEnabled = false;

var shouldMasonry = function () {
  return $(window).width() > tinyScreenUp;
}

var initMasonry = _.debounce(function () {
  var $pins = $("#pins");

  if (shouldMasonry()) {
    if (!masonryIsEnabled) {
      masonryIsEnabled = true;
      $pins.masonry({
        itemSelector: '.box',
        isFitWidth: true
      });
    }
  }
  else if (masonryIsEnabled) {
    masonryIsEnabled = false;
    $pins.masonry('destroy');
    $pins.css({ width: "auto", height: "auto" });
  }
}, 100);

var onLoad = function () {
  masonryIsEnabled = false;
  initMasonry();
  $('#pins').imagesLoaded(initMasonry);
}

$(onLoad);
// $(document).on('page:load', initMasonry) // jquery.turbolinks handles this for us.

$(window).on("resize", initMasonry);
