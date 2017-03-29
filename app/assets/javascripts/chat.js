$(document).ready(function() {
  $('#messages-content').hide;
  $(window).load(function() {
    console.log('hello');
    var tabactive = $('.listing')[0];
    console.log(tabactive);
    var conv_active = tabactive.data('target');
    console.log(conv_active);
    conv_active.addClass('active');
    var onload_id = active.data('target');
    console.log(onload_id);
    $('.conversation').removeClass('hidden');
  });
  $('.listing').on('click', function () {
    // Change active tab
    $('.listing').removeClass('active');
    var active = $(this).addClass('active');
    var conv_id = active.data('target');
    console.log('hello');
    console.log(conv_id);
    // console.log(active);
    // Hide all tab-content (use class="hidden")
    var hidden = $(conv_id).hasClass('hidden');
    console.log(hidden);
    $('.conversation').addClass('hidden');
    // var content = $('.conversation').text();
    // console.log(content);
    // console.log(content);
    // var conversation_id = $(this).data('target');
    // console.log(conversation_id);
    if(hidden) {
      $(conv_id).removeClass('hidden');
     };
  });
});

