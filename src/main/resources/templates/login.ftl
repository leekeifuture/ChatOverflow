<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
    <h1 class="mb-1">Sign In</h1>
    <h5 style="color: red;">${message?ifExists}</h5>
    <@l.login "/login" false/>
</@c.page>
