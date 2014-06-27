# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# window.setTimeout(function() { $(".alert-message").alert('close'); }, 2000);
# timeout_action = $ -> $("#alert-message").alert('close')

setTimeout((->
    $("#alert-message").removeClass('in')
    $("#alert-message").alert('close')
), 1000)