var currentTab = (function () {


    //variables
    var $window = $('#text-column'),
        $section = $('section'),
        $scrollPosition = $window.scrollTop(),
        $sectionHeights = [];


    //will calculate each section heights and store them in sectionHeights[] array
    function resizeSectionHeights() {

        $section.each(function (i) {
            $sectionHeights[i] = $(this).outerHeight();
        });

    }


    /*will calculate current scroll position. If it's between the top and bottom of a section,
      the tab containing an href value of that section id will have the .current class.*/
    function applyCurrentState() {

        $scrollPosition = $window.scrollTop();

        $section.each(function (i) {    //we indent i at each section count, so we can find it's height in sectionHeight[]

            var $anchor = $("a[href='#" + $(this).attr('id') + "']"),
                $sectionTop = $(this).offset().top - 1,                    // -1 get rid of calculation errors
                $sectionBottom = $sectionTop + $sectionHeights[i] - 1;    // -1 get rid of calculation errors

            if ($scrollPosition >= $sectionTop && $scrollPosition < $sectionBottom) {

                $anchor.addClass('current');

            } else {

                $anchor.removeClass('current');
            }
        });
    }


    //binding events
    $window.resize(resizeSectionHeights);
    $window.scroll(applyCurrentState);


    //initialization
    resizeSectionHeights();

}());
