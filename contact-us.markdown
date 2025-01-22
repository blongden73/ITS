---
title: Contact Us
permalink: "/contact-us/"
layout: default
---

<section id="contact-us">
    <h1>{{ page.title }}</h1>

    <div class="contact-info">
        <div class="container flex">
        <div class="left">
            <p><strong>In The Stix</strong><br>
            {{ site.data.contact.address | markdownify }}</p>
        </div>
        <div class="right">
            <p><strong>Email:</strong> <a href="mailto:{{ site.data.contact.email }}">{{ site.data.contact.email }}</a></p>
            <p><strong>Phone:</strong>
                {% for number in site.data.contact.phone %}
                <a href="tel:+44{{ number | remove: ' ' }}">{{ number }}</a>{% unless forloop.last %} / {% endunless %}
                {% endfor %}
            </p>
            <p><strong>What3Words:</strong> <a href="https://what3words.com">{{ site.data.contact.what3words }}</a></p>
        </div>
        </div>
    </div>
    
    <div class="map-container">
        <iframe 
            src="{{ site.data.contact.map_url }}" 
            width="100%" 
            height="450" 
            allowfullscreen="" 
            loading="lazy">
        </iframe>
    </div>    
</section>

