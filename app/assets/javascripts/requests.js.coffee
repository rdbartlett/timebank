# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('#show-contacts').on 'click', (e) ->
    $('.contact').show()
  $('#hide-contacts').on 'click', (e) ->
    $('.contact').hide()
  $('.service').on 'click', (e) ->
    $(this).hide()
  $('.category').on 'click', (e) ->
    $(this).hide()