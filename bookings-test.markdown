---
title: Book Now
permalink: "/book-test/"
layout: booking
---

<section id="book-now">
    <h1>{{ page.title }}</h1>

    <div class="booking-buttons">
        {% for button in site.data.book-now.buttons %}
        <a href="{{ button.link }}" class="btn">{{ button.label }}</a>
        {% endfor %}
    </div>

    <div class="booking-platform">
        <p>Booking platform integration goes here.</p>
    </div>
</section>
