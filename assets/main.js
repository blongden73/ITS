// Carousel Functionality
const carousel = document.querySelector('.carousel');
if(carousel) {
const slides = carousel.querySelectorAll('.carousel-slide');
let currentIndex = 0;

function showSlide(index) {
    slides.forEach((slide, i) => {
        slide.classList.remove('active');
        if (i === index) {
            slide.classList.add('active');
        }
    });
}

function nextSlide() {
    currentIndex = (currentIndex + 1) % slides.length;
    showSlide(currentIndex);
}

// Auto-rotate for hero carousel
setInterval(nextSlide, 5000); // Change slide every 5 seconds
}

// Reviews Carousel
const reviewsCarousel = document.querySelector('.reviews-carousel');
if(reviewsCarousel){
const reviewSlides = reviewsCarousel.querySelectorAll('.carousel-slide');
}
let reviewIndex = 0;

function showReview(index) {
    reviewSlides.forEach((slide, i) => {
        slide.classList.remove('active');
        if (i === index) {
            slide.classList.add('active');
        }
    });
}

function nextReview() {
    reviewIndex = (reviewIndex + 1) % reviewSlides.length;
    showReview(reviewIndex);
}

// Auto-rotate for reviews carousel
setInterval(nextReview, 7000); // Change slide every 7 seconds

    // document.querySelector('.play-button').addEventListener('click', function () {
    //     const video = document.getElementById('hero-video');
    //     video.style.display = 'block';
    //     video.play();
    // });


$('.img-parallax').each(function(){
    var img = $(this);
    var imgParent = $(this).parent();
    function parallaxImg () {
        var speed = img.data('speed');
        var imgY = imgParent.offset().top;
        var winY = $(this).scrollTop();
        var winH = $(this).height();
        var parentH = imgParent.innerHeight();
    
    
        // The next pixel to show on screen      
        var winBottom = winY + winH;
    
        // If block is shown on screen
        if (winBottom > imgY && winY < imgY + parentH) {
        // Number of pixels shown after block appear
        var imgBottom = ((winBottom - imgY) * speed);
        // Max number of pixels until block disappear
        var imgTop = winH + parentH;
        // Porcentage between start showing until disappearing
        var imgPercent = ((imgBottom / imgTop) * 100) + (50 - (speed * 50));
        }
        img.css({
        top: imgPercent + '%',
        transform: 'translate(-50%, -' + imgPercent + '%)'
        });
    }
    $(document).on({
        scroll: function () {
        parallaxImg();
        }, ready: function () {
        parallaxImg();
        }
    });
    });

$(document).ready(function() {
 
    $(".owl-carousel").each(function(){
        $(this).owlCarousel({
    
        navigation : true, // Show next and prev buttons
    
        slideSpeed : 300,
        paginationSpeed : 400,
    
        items : 1, 
        itemsDesktop : false,
        itemsDesktopSmall : false,
        itemsTablet: false,
        itemsMobile : false,
        navigationText : false
       
    });
});
});

