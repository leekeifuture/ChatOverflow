<#import "parts/common.ftl" as c />
<#import "parts/login.ftl" as l />
<@c.page>
    <h1 class="mb-1">Registration</h1>
    <h5>${message?ifExists}</h5>
    <@l.login "/registration" true />
</@c.page>
