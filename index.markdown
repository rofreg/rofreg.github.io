---
layout: homepage
full_title: Ryan Laughlin is a person on the Internet
---

<h3>current occupation:</h3>
co-founder and CTO at <a href="https://www.splitwise.com">Splitwise</a>

<h3>email:</h3>
<a href="mailto:ryan@splitwise.com?Subject=Hello!">ryan@splitwise.com</a>

<h3>mastodon:</h3>
<a rel="me" href="https://hachyderm.io/@rofreg">rofreg@hachyderm.io</a>

<hr>

<h3>projects:</h3>
<ul>
  <li>
    <a href="https://www.pinchpad.com" target="_blank">Hourly Comics</a>
    <span>journal comics since 2010</span>
  </li>
  <li>
    <a href="https://itunes.apple.com/us/app/lightweight-simple-weight/id690015714?mt=8" target="_blank">Lightweight</a>
    <span>weight &amp; calorie tracker</span>
  </li>
  <li>
    <a href="https://itunes.apple.com/us/app/pinch-pad-post-sketches-to/id999197469?mt=8" target="_blank">Pinch Pad</a>
    <span>simple drawing app</span>
  </li>
  <li>
    <a href="/talks">Conference talks</a>
    <span>checkups and more</span>
  </li>
  <li class="more">
    <a href="/projects">More projects</a>
  </li>
</ul>

<hr>

<h3>recent blog posts:</h3>
<ul>
  {% for post in site.posts limit:1 %}
    <li>
      <a href="{{ post.url }}">{{ post.title }}</a>
      <span>{{ post.subtitle }}</span>
    </li>
  {% endfor %}
  <li class="more">
    <a href="/blog">More blog posts</a>
  </li>
</ul>

<div id="peace">
  cheers! &ndash;rjl
</div>