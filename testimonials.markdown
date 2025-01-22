---
title: Testimonials
permalink: "/testimonials/"
layout: default
---

<section id="testimonials">
    <h1>{{ page.title }}</h1>
    <p>Rutland is a beautiful and often overlooked county due to its size. It is the smallest county in England but with so much to offer its visitors.</p>

    <div class="testimonials-grid">
        {% for testimonial in site.data.testimonials %}
        <article class="testimonial-card">
            <h3>{{ testimonial.name }}</h3>
            <div class="rating">
                {% for star in (1..testimonial.rating) %}
                <span>★</span>
                {% endfor %}
            </div>
            <p>{{ testimonial.content }}</p>
        </article>
        {% endfor %}
    </div>
</section>
