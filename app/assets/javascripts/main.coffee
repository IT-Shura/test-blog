Turbolinks.enableProgressBar();

$(document).on 'page:load', ->
  console.log "page load"
  
$(document).on 'ready page:load', ->
  Waves.displayEffect(); # Initialize buttons wave effects
  $('.button-collapse').sideNav(); # Initialize collapse button
  $('.dropdown-button').dropdown();
  $('ul.tabs').tabs();
