---
layout: page
permalink: /publications/
title: Publications
description: * denotes equal contribution
years: [2025,2024,2023,2022,2021,2019,2018,2015]
nav: true
nav_order: 1
---
<!-- _pages/publications.md -->
<div class="publications">

{%- for y in page.years %}
  <h2 class="year">{{y}}</h2>
  {% bibliography -f {{ site.scholar.bibliography }} -q @*[year={{y}}]* %}
{% endfor %}

</div>
