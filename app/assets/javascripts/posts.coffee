# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready page:load', ->
  $(".comment").on "click", ->
    console.log("button clicked!")
    $.post $(@).data('url'), act: $(@).data('act'), (data) ->
      Turbolinks.visit('/posts/' + data.post_id)