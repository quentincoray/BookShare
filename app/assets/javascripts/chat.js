$(document).ready(function() {
  $('#messages-content').hide;
    // console.log('hello');
    var tabactive = $('a.listing:first-child');
    // console.log(tabactive);
    tabactive.addClass('active');
    var conv_active = tabactive.data('target');
    // console.log(conv_active);
    $(conv_active).removeClass('hidden');
  $('.listing').on('click', function () {
    // Change active tab
    $('.listing').removeClass('active');
    var active = $(this).addClass('active');
    var conv_id = active.data('target');
    // console.log('hello');
    // console.log(conv_id);
    // console.log(active);
    // Hide all tab-content (use class="hidden")
    var hidden = $(conv_id).hasClass('hidden');
    // console.log(hidden);
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

