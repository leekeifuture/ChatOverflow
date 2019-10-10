<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <h1>Add new user</h1>
    <span>
        {{$message}}
    </span>
    <@l.login "/registration" />
</@c.page>
