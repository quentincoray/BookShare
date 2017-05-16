$(document).ready(function() {
  $(function(){

    $(".bookmate-tab-link").on("click", function(e){
      // Change active tab
      $(".bookmate-tab-link").removeClass('active');
      $(this).addClass('active');
    });
    // e.target.getAttribute('data-target')
    // $('a.scroll').on('click', function (e) {
    //   var href = e.target.getAttribute('data-target');
    //   var testing = $(this).data('target');
    //   var target = this.hash;
    //     $target = $(target);
    //     console.log($target);
    //   $('html, body').animate({
    //       scrollTop: $(href).offset().top
    //   }, 'slow');
    //   e.preventDefault();
    // });
    // // $('a.scroll').on('click', function (e) {
    //   var href = $(this).attr('href');
    //   $('html, body').animate({
    //       scrollTop: $(href).offset().top
    //   }, 'slow');
    //   e.preventDefault();
    // });
  });

  // $(".scrollto").click(function(event) {
  //     event.preventDefault();

  //     var defaultAnchorOffset = 0;

  //     var anchor = $(this).attr('data-attr-scroll');

  //     var anchorOffset = $('#'+anchor).attr('data-scroll-offset');
  //     if (!anchorOffset)
  //         anchorOffset = defaultAnchorOffset;

  //     $('html,body').animate({
  //         scrollTop: $('#'+anchor).offset().top - anchorOffset
  //     }, 500);
  // });
});

// $(document).ready(function() {

//   // // var tabactive = $('a.bookmate-tabl-link:first-child');
//   // // tabactive.addClass('active');

//   // $(document).on("scroll", onScroll);

//   // //smoothscroll
//   // $('.bookmate-tabs a[href^="#"]').on('click', function (e) {
//   //   e.preventDefault();
//   //   $(document).off("scroll");

//   //   // Change active tab
//   //   $(".bookmate-tabs a").removeClass('active');
//   //   $(this).addClass('active');
//   //   // var link = $('.bookmate-tab a')
//   //   var target = this.hash,
//   //       menu = target;
//   //   $target = $(target);
//   //   $('html, body').stop().animate({
//   //       'scrollTop': $target.offset()
//   //   }, 500, 'swing', function () {
//   //       window.location.hash = target;
//   //       $(document).on("scroll", onScroll);
//   //   });
//   // });
// });

// function onScroll(event){
//   var scrollPos = $(document).scrollTop();
//     console.log('on entre dans la fonction onScroll');
//     console.log(scrollPos);
//   $('.bookmate-tabs a').each(function () {
//     var currLink = $(this);
//     var refElement = $(currLink.attr("href"));
//     console.log('rslt 1');
//     console.log(refElement);
//     console.log('rslt 2');
//     console.log(refElement.position().top);
//     console.log('rslt 3');
//     console.log(scrollPos);
//     console.log('rslt 4');
//     console.log(refElement.position().top);
//     console.log('rslt 5');
//     console.log(refElement.height());
//     console.log('rslt 6');
//     console.log(scrollPos);


//     if (refElement.position().top <= scrollPos && refElement.position().top + refElement.height() > scrollPos) {
//         $('.bookmate-tabs a').removeClass("active");
//         currLink.addClass("active");
//         console.log('test');
//     }
//     else{
//         currLink.removeClass("active");
//        }
//   });
// }




  // $(function(){

  //   var tabactive = $('.bookmate-tab:first-child');
  //   tabactive.addClass('active');

  //   $(".bookmate-tab").on("click", function(e){
  //     // Change active tab
  //     $(".bookmate-tab").removeClass('active');
  //     $(this).addClass('active');

  //     var target = this.hash,
  //         menu = target;
  //     $target = $(target);
  //     $('html, body').stop().animate({
  //         'scrollTop': $target.offset().top+2
  //     }, 500, 'swing', function () {
  //         window.location.hash = target;
  //         $(document).on("scroll", onScroll);
  //     });
  //   });
  // });



// (document).ready(function() {
//   $('#messages-content').hide;
//     // console.log('hello');
//     var tabactive = $('a.listing:first-child');
//     console.log(tabactive);
//     tabactive.addClass('active');
//     var conv_active = tabactive.data('target');
//     console.log(conv_active);
//     $(conv_active).removeClass('hidden');
//   $('.listing').on('click', function () {
//     // Change active tab
//     $('.listing').removeClass('active');
//     var active = $(this).addClass('active');
//     var conv_id = active.data('target');
//     console.log('hello');
//     console.log(conv_id);
//     // console.log(active);
//     // Hide all tab-content (use class="hidden")
//     var hidden = $(conv_id).hasClass('hidden');
//     console.log(hidden);
//     $('.conversation').addClass('hidden');
//     // var content = $('.conversation').text();
//     // console.log(content);
//     // console.log(content);
//     // var conversation_id = $(this).data('target');
//     // console.log(conversation_id);
//     if(hidden) {
//       $(conv_id).removeClass('hidden');
//      };
//   });
// });
