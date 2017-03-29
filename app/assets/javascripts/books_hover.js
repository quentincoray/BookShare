$(document).ready(function() {
  $('.card').on('mouseenter', function(){
    $(this).nextAll().addClass('has-positive-translate')
    $(this).prevAll().addClass('has-negative-translate')

  }).on('mouseleave', function() {
    removeHasClasses()
  });

  function removeHasClasses() {
    $('.card').removeClass('has-negative-translate has-positive-translate')
  }
});
