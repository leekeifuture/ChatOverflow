<#macro page>
    <!DOCTYPE HTML>
    <html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>ChatOverflow</title>
        <meta content="width=device-width, initial-scale=1, shrink-to-fit=no,
              maximum-scale=1, user-scalable=no, minimal-ui" name="viewport">

        <!-- Font Awesome CSS -->
        <link rel="stylesheet" type="text/css"
              href="/static/css/font-awesome/all.min.css" />

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" type="text/css"
              href="/static/css/bootstrap.min.css" />

        <!-- Rechaptcha Script -->
        <script type="text/javascript"
                src="/static/js/recaptcha/api.js"></script>

        <!-- Turbolinks Script -->
        <#-- TODO friendship with recapthca -->
        <script type="text/javascript"
                src="/static/js/turbolinks.js"></script>

        <!-- Custom CSS -->
        <link rel="stylesheet" type="text/css"
              href="/static/css/style.css" />
    </head>
    <body>
    <#include "navbar.ftl" />
    <div class="container mt-5">
        <#nested>
    </div>
    <!-- Scripts for Bootstrap (jQuery first, then Popper.js, then Bootstrap JS) -->
    <script type="text/javascript"
            src="/static/js/bootstrap/jquery-3.4.1.slim.min.js"></script>
    <script type="text/javascript"
            src="/static/js/bootstrap/popper.min.js"></script>
    <script type="text/javascript"
            src="/static/js/bootstrap/bootstrap.min.js"></script>
    </body>
    </html>
</#macro>
