---
permalink: /contact/
layout: single
author_profile: true
title: "Contact" # use " " to remove title from header
header:
    overlay_image: "/assets/images/teaser.jpg"
---

{: .text-center}
<h3>Head office</h3>

{: .text-center}
Foxrift  
78, Avenue des Champs-Elysées, Bureau 326  
75008, Paris

{: .text-center}
<h3>Email</h3>

{: .text-center}
<a href="mailto:{{ site.author.email }}">{{ site.author.email }}</a>

{: .text-center}
<h3>Form</h3>

{: .text-center}
You can also contact us using the following form.

{: .text-center}
<form action="https://getform.io/f/444e05e5-bb40-4ef4-a164-1641c9b6b43f" method="POST">
    <div>
        <label for="name">Name</label>
        <input id="name" type="text" name="name" required>
    </div>
    <div>
        <label for="email">Email address</label>
        <input id="email" type="email" name="email" required>
    </div>
    <select name="topic" required>
        <option value="user">User</option>
        <option value="customer">Customer</option>
        <option value="contractor">Contractor</option>
        <option value="investor">Investor</option>
    </select>
    <div>
        <label for="message">Message</label>
        <textarea id="message" name="message" required></textarea>
    </div>
    <!-- add hidden Honeypot input to prevent spams -->
    <input type="hidden" name="_gotcha" style="display:none !important">
    <!-- select field handle -->
    <small>By contacting us you agree with our <a href="/tos" target="_blank">Terms of Service</a></small>
    <div>
        <button class="btn warning" type="submit">Send</button>
    </div>
</form>
