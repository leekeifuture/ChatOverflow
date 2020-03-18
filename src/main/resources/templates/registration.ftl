<#import "parts/base.ftl" as b />
<#import "parts/login.ftl" as l />
<@b.page>
    <h1 class="mb-1">Registration</h1>
    <h5>${message?ifExists}</h5>
    <@l.login "/registration" true />
</@b.page>
