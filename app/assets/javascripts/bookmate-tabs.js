$(document).ready(function() {
  $(function(){

    $(".bookmate-tab-link").on("click", function(e){
      // Change active tab
      $(".bookmate-tab-link").removeClass('active');
      $(this).addClass('active');
    });
  });
});

