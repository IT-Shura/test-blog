Turbolinks.enableProgressBar();

$(document).on 'ready page:load', ->
  Waves.displayEffect(); # Initialize buttons wave effects
  $(".button-collapse").sideNav(); # Initialize collapse button
  $('ul.tabs').tabs();
