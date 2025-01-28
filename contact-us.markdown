---
title: Contact Us
permalink: "/contact-us/"
layout: default
---

<section id="contact-us">
    <div class="about ripped after-ripped">
        <h2>{{ page.title }}</h2>
    </div>
    <div class="contact-info">
        <div class="container flex">
        <div class="left">
            <p><strong>In The Stix</strong><br>
            {{ site.data.contact.address | markdownify }}</p>
        </div>
        <div class="right">
            <p><a href="mailto:{{ site.data.contact.email }}">{{ site.data.contact.email }}</a></p>
            <p> {% for number in site.data.contact.phone %}
                T: <a href="tel:+44{{ number | remove: ' ' }}">{{ number }}</a>{% unless forloop.last %} / {% endunless %}
                {% endfor %}
            </p>
            <p class="smaller-text">For precise location</p>
            <p class="flex-www"><img src="/assets/images/what3wrods.png"><a href="https://inthestix.co.uk/contact/#:~:text=cool.actors.showrooms">{{ site.data.contact.what3words }}</a></p>
        </div>
        </div>
        <div class="container">
            <div class="map-container">
                <iframe src="https://my.atlist.com/map/7fd5c4d2-1351-46ca-9f7e-affdfd04de6a?share=true" allow="geolocation 'self' https://my.atlist.com" width="100%" height="800px" loading="lazy" frameborder="0" scrolling="no" allowfullscreen id="atlist-embed"></iframe>
            </div>
        </div> 
    </div>  
</section>

