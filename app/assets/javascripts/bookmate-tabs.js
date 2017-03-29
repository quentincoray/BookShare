$(document).ready(function() {
  $(function(){

    $(".bookmate-tab").on("click", function(e){
      // Change active tab
      $(".bookmate-tab").removeClass('active');
      $(this).addClass('active');
    });
  });
});
