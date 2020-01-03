<#macro page>
    <!DOCTYPE HTML>
    <html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>ChatOverflow</title>
        <meta name="viewport"
              content="width=device-width, initial-scale=1, shrink-to-fit=no" />

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" type="text/css"
              href="/static/css/bootstrap.min.css" />
        <!-- Font Awesome CSS -->
        <link rel="stylesheet" type="text/css"
              href="/static/css/all.min.css" />

        <!-- Rechaptcha Script -->
        <script src="/static/js/api.js"></script>
        <!-- Turbolinks Script -->
        <script src="/static/js/turbolinks.js"></script>

        <link rel="stylesheet" type="text/css"
              href="/static/css/style.css" />
    </head>
    <body>
    <#include "navbar.ftl" />
    <div class="container mt-5">
        <#nested>
    </div>
    <!-- Scripts for Bootstrap (jQuery first, then Popper.js, then Bootstrap JS) -->
    <script src="/static/js/jquery-3.4.1.slim.min.js"></script>
    <script src="/static/js/popper.min.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    </body>
    </html>
</#macro>
