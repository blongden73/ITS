---
title: This is a Blog Title
date: 2024-12-23 00:00:00 Z
layout: post
featured_image: "/assets/images/featured-placeholder.jpg"
---

<section id="blog-post">
    <div class="blog-header">
        <h1>{{ page.title }}</h1>
        <p class="post-date">{{ page.date | date: "%B %d, %Y" }}</p>
        <p>Rutland is a beautiful and often overlooked county due to its size. It is the smallest county in England but with so much to offer its visitors.</p>
    </div>

    <div class="blog-content">
        <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage...</p>

        <img src="{{ page.featured_image }}" alt="Featured Image">

        <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor...</p>

        <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC...</p>
    </div>
</section>
