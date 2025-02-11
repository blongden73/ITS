// Carousel Functionality
const carousel = document.querySelector('.carousel');
if (carousel) {
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
const ReviewCarousel = document.querySelector(".reviews-carousel");
if (ReviewCarousel) {
    document.addEventListener("DOMContentLoaded", function () {
        const items = ReviewCarousel.querySelectorAll(".carousel-item");
        const prevButton = ReviewCarousel.querySelector(".prev");
        const nextButton = ReviewCarousel.querySelector(".next");
        const pager = ReviewCarousel.querySelector(".carousel-pager");

        let currentIndex = 0;

        // Create pager dots dynamically
        items.forEach((_, index) => {
            const dot = document.createElement("div");
            dot.classList.add("dot");
            if (index === currentIndex) dot.classList.add("active");
            pager.appendChild(dot);

            // Add click event for dots
            dot.addEventListener("click", () => {
                currentIndex = index;
                updateCarousel();
            });
        });

        const dots = pager.querySelectorAll(".dot");

        function updateCarousel() {
            // Update items
            items.forEach((item, index) => {
                item.classList.toggle("active", index === currentIndex);
            });

            // Update dots
            dots.forEach((dot, index) => {
                dot.classList.toggle("active", index === currentIndex);
            });
        }

        // Event listeners for navigation buttons
        prevButton.addEventListener("click", () => {
            currentIndex = (currentIndex - 1 + items.length) % items.length;
            updateCarousel();
        });

        nextButton.addEventListener("click", () => {
            currentIndex = (currentIndex + 1) % items.length;
            updateCarousel();
        });

        // Initialize carousel
        updateCarousel();
    });
}

// Awards Carousel
const AwardsCarousel = document.querySelector(".awards-carousel");
if (AwardsCarousel) {
    document.addEventListener("DOMContentLoaded", function () {
        const items = AwardsCarousel.querySelectorAll(".carousel-item");
        const prevButton = AwardsCarousel.querySelector(".prev");
        const nextButton = AwardsCarousel.querySelector(".next");
        const pager = AwardsCarousel.querySelector(".carousel-pager");

        let currentIndex = 0;

        // Create pager dots dynamically
        items.forEach((_, index) => {
            const dot = document.createElement("div");
            dot.classList.add("dot");
            if (index === currentIndex) dot.classList.add("active");
            pager.appendChild(dot);

            // Add click event for dots
            dot.addEventListener("click", () => {
                currentIndex = index;
                updateCarousel();
            });
        });

        const dots = pager.querySelectorAll(".dot");

        function updateCarousel() {
            // Update items
            items.forEach((item, index) => {
                item.classList.toggle("active", index === currentIndex);
            });

            // Update dots
            dots.forEach((dot, index) => {
                dot.classList.toggle("active", index === currentIndex);
            });
        }

        // Event listeners for navigation buttons
        prevButton.addEventListener("click", () => {
            currentIndex = (currentIndex - 1 + items.length) % items.length;
            updateCarousel();
        });

        nextButton.addEventListener("click", () => {
            currentIndex = (currentIndex + 1) % items.length;
            updateCarousel();
        });

        // Initialize carousel
        updateCarousel();
    });
}

// Parallax Effect
$(document).ready(function () {
    $('.img-parallax').each(function () {
        var img = $(this);
        var imgParent = $(this).parent();

        function parallaxImg() {
            var speed = img.data('speed');
            var imgY = imgParent.offset().top;
            var winY = $(this).scrollTop();
            var winH = $(this).height();
            var parentH = imgParent.innerHeight();
            var winBottom = winY + winH;

            if (winBottom > imgY && winY < imgY + parentH) {
                var imgBottom = ((winBottom - imgY) * speed);
                var imgTop = winH + parentH;
                var imgPercent = ((imgBottom / imgTop) * 100) + (50 - (speed * 200));
            }

            img.css({
                top: imgPercent + '%',
                transform: 'translate(-50%, -' + imgPercent + '%)'
            });
        }

        $(document).on({
            scroll: function () {
                parallaxImg();
            },
            ready: function () {
                parallaxImg();
            }
        });
    });

    // Owl Carousel
    $(".owl-carousel").each(function () {
        $(this).owlCarousel({
            navigation: true, // Show next and prev buttons
            slideSpeed: 300,
            paginationSpeed: 400,
            items: 1,
            itemsDesktop: false,
            itemsDesktopSmall: false,
            itemsTablet: false,
            itemsMobile: false,
            navigationText: false
        });
    });
});
