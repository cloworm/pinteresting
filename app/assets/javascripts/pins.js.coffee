# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Below is used to render this before a page loads
initMasonry = ->
  $('#pins').masonry
    itemSelector: '.box'
    isFitWidth: true

onLoad = ->
  initMasonry()
  $('#pins').imagesLoaded(initMasonry)

$(onLoad)
# $(document).on('page:load', initMasonry) # jquery.turbolinks handles this for us.
