<#include "security.ftl" />
<#import "login.ftl" as l />
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/">ChatOverflow</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div id="navbarSupportedContent" class="collapse navbar-collapse">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/">Home</a>
            </li>
            <#if user??>
                <li class="nav-item">
                    <a class="nav-link" href="/main">Messages</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link"
                       href="/user-messages/${currentUserId}">My messages</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/user/profile">Profile</a>
                </li>
            </#if>
            <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link" href="/user">User list</a>
                </li>
            </#if>
        </ul>
        <#if user?? && name??>
            <form action="/logout" method="post">
                <div class="navbar-text mr-3">${name}</div>
                <button class="btn btn-primary" type="submit">Sign Out</button>
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
            </form>
        <#else>
            <a class="btn btn-primary" href="/login">Sign In</a>
        </#if>
    </div>
</nav>
