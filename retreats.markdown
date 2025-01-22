---
title: Retreats
permalink: "/retreats/"
layout: default
---

<section id="retreats">
    <h1>{{ page.title }}</h1>
    <p>Rutland is a beautiful and often overlooked county due to its size. It is the smallest county in England but with so much to offer its visitors.</p>

    <div class="retreat-cards">
        {% for retreat in site.data.retreats %}
        <article class="retreat-card">
            <img src="{{ retreat.image }}" alt="{{ retreat.title }}">
            <h3>{{ retreat.title }}</h3>
            <p>{{ retreat.description }}</p>
            <a href="{{ retreat.link }}" class="read-more">Learn More</a>
        </article>
        {% endfor %}
    </div>
</section>
