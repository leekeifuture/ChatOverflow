<#macro page>
    <!DOCTYPE HTML>
    <html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>ChatOverflow</title>
        <meta name="viewport"
              content="width=device-width, initial-scale=1, shrink-to-fit=no" />

        <link rel="stylesheet" type="text/css"
              href="/static/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css"
              href="/static/css/all.min.css" />

        <script src="/static/js/api.js"></script>

        <link rel="stylesheet" type="text/css"
              href="/static/css/style.css" />
    </head>
    <body>
    <#include "navbar.ftl" />
    <div class="container mt-5">
        <#nested>
    </div>
    <script src="/static/js/jquery-3.4.1.slim.min.js"></script>
    <script src="/static/js/popper.min.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    </body>
    </html>
</#macro>
