$(document).ready(function () {

    $('.bxslider').bxSlider({
        minSlides: 3,
        maxSlides: 3,
        slideMargin: 60,
        slideWidth: 500,
        pause: 7000,
        controls: true,
        pager: false,
        auto: false,
        autoHover: true
    });

    $('.graduateslider').bxSlider({
        minSlides: 4,
        maxSlides: 4,
        slideMargin: 10,
        slideWidth: 255,
        pause: 6000,
        controls: true,
        pager: false,
        auto: false,
        autoHover: true
    });

    $('.bxslider-b-a').bxSlider({
        pause: 7000,
        width: '60%',
        controls: true,
        pager: false,
        auto: false,
        autoHover: true,
        mode: 'fade'

    });

});