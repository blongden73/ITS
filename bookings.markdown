---
title: Book Now
permalink: "/book-now/"
layout: default
---

<section id="book-now">
    <div class="about">
        <h2>{{ page.title }}</h2>
    </div>

    <!-- <div class="booking-buttons">
        {% for button in site.data.book-now.buttons %}
        <a href="{{ button.link }}" class="btn">{{ button.label }}</a>
        {% endfor %}
    </div> -->

    <!-- <div class="booking-platform">
        <p>Booking platform integration goes here.</p>
    </div> -->
    <div class="booking-platform-hide">
        <iframe id="myIframe" src="https://secure.supercontrol.co.uk/availability/availability_grid.asp?ownerID=20331&siteID=42540" height="1300px"></iframe>
    </div>
</section>
