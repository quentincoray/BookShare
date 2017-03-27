$(document).ready(function() {
  $(function(){

    $(".tab").on("click", function(e){
      // Change active tab
      $(".tab").removeClass('active');
      $(this).addClass('active');
      // Hide all tab-content (use class="hidden")
      $(".tab-content").addClass('hidden');
      // Show target tab-content (use class="hidden")
      $($(this).data('target')).removeClass('hidden');
    });

    if ($(".tab-content").length) {
      var anchor = window.location.hash;

      // trigger click on sidebar to show the correct tab content
      if (anchor != '') {
        $('a[data-target="' + anchor + '"]').trigger('click');
      }
    }
  });
});
