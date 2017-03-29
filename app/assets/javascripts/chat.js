$(document).ready(function() {
  $('#messages-content').hide;
  $('.listing').on('click', function () {
    // Change active tab
    $('.listing').removeClass('active');
    $(this).addClass('active');
    // Hide all tab-content (use class="hidden")
    $('.conversation').addClass('hidden')
    // var content = $('.conversation').text();
    // console.log(content);
    // console.log(content);
    var conversation_id = $(this).data('target');
    console.log(conversation_id);
    $(conversation_id).toggleClass('hidden');
  });
});

