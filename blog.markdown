---
title: Blog
permalink: "/blog/"
layout: blog
---

<section id="blog">
    <h2>{{ page.title }}</h2>

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
