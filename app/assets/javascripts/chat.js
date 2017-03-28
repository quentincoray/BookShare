$(document).ready(function() {
  $('#messages-content').hide;
  $('.blabla').on('click', function () {
    $('.conversation').addClass('hidden')
    var content = $(this).text()
    console.log(content);
    var conversation_id = $(this).data('target');
    console.log(conversation_id);
    $(conversation_id).removeClass('hidden');
  });
});
