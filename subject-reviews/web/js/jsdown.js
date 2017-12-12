$('.owl-carousel').owlCarousel({
    autoplay: true,
    center: true,
    loop: true,
    nav: true,
    autoplayTimeout: 3000,
    autoplayHoverPause: true,
    responsive: {
        0: {
            items: 1
        },
        1000: {
            items: 3}
    }
});

$('#fullpage').fullpage({
    sectionSelector: '.vertical-scrolling',
    navigation: true,
    slidesNavigation: true,
    controlArrows: false,
    anchors: ['firstSection', 'secondSection', 'thirdSection']
});


    
