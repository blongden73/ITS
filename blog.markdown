---
title: Blog
permalink: "/blog/"
layout: default
---

<section id="blog">
    <h1>{{ page.title }}</h1>
    <p>Rutland is a beautiful and often overlooked county due to its size. It is the smallest county in England but with so much to offer its visitors.</p>

    <div class="blog-cards">
        {% for post in site.posts %}
        <article class="blog-card">
            <img src="{{ post.featured_image }}" alt="{{ post.title }}">
            <h3>{{ post.title }}</h3>
            <p>{{ post.excerpt }}</p>
            <a href="{{ post.url }}" class="read-more">Read More</a>
        </article>
        {% endfor %}
    </div>
</section>
