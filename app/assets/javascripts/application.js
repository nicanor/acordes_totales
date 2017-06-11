// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require chords
//= require turbolinks
//= require_self

var ready, fetch, back;

ready = function(){
  $("a[href='" + window.location.pathname + "']").parent().addClass('active untouchable');
  $("a[href='" + window.location.pathname + "'].list-group-item").addClass('active-tab');

  var artistLink = $('#artist-link').find('a').attr('href');
  $('.artist-list').find('a[href="'+artistLink+'"]').parent().addClass('active');

  $('body').tooltip({selector: '.tooltiped'});

  $('#scroll').find('a').on('click', function(){

    $("html, body").on("scroll mousedown DOMMouseScroll mousewheel keyup", function(){
      $('html, body').stop();
    });

    $('html, body').animate({scrollTop: $('footer').offset().top}, 100000);
  });

  initialize_chords();
};

$(document).ready(ready);

$(document).on('page:load', ready);