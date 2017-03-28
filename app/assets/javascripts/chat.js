$(document).ready(function() {
  $('#messages-content').hide;
  $('.listing').on('click', function () {
    $('.conversation').addClass('hidden')
    var content = $(this).text()
    console.log(content);
    var conversation_id = $(this).data('target');
    console.log(conversation_id);
    $(conversation_id).removeClass('hidden');
  });

    // this.$textarea = $('#message-to-send');
    // addMessage: function() {
    //   this.messageToSend = this.$textarea.val()
    //   this.render();
    // },
    // addMessageEnter: function(event) {
    //     // enter was pressed
    //     if (event.keyCode === 13) {
    //       this.addMessage();
    //     }
    // },
    // scrollToBottom: function() {
    //    this.$chatHistory.scrollTop(this.$chatHistory[0].scrollHeight);
    // },
});
