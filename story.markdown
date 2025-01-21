---
layout: default
title: Our Story
permalink: /our-story/
---

<section id="our-story">
    <div class="hero">
        <img src="/assets/images/hero-placeholder.jpg" alt="Hero Image">
        <button class="play-button" aria-label="Play Video">▶</button>

        <video id="hero-video" controls style="display: none;">
            <source src="/assets/videos/hero-video.mp4" type="video/mp4">
            Your browser does not support the video tag.
        </video>        
    </div>

    <div class="content">
        {% for item in site.data.philosophy %}
        <article class="philosophy">
            <h2>{{ item.title }}</h2>
            <p>{{ item.description }}</p>
        </article>
        {% endfor %}
    </div>
</section>
