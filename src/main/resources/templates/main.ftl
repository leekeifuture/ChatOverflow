<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <h1>Main page</h1>
    <div style="box-sizing: border-box; padding: 2px;">
        <@l.logout />
        <span><a href="/user">User list</a></span>
    </div>
    <div style="box-sizing: border-box; padding: 2px;">
        <form method="post">
            <input type="text" name="text" placeholder="Message"/>
            <input type="text" name="tag" placeholder="Tag"/>
            <button type="submit">Add</button>
            <input type="hidden" name="_csrf" value="${ _csrf.token }"/>
        </form>
    </div>
    <div style="box-sizing: border-box; padding: 2px;">Messages list:</div>
    <form method="get" action="/main">
        <input type="text" name="filter" value="${filter}" />
        <button type="submit">Search</button>
    </form>
    <#list messages as message>
        <div>
            <b>${ message.id }</b>
            <span>${ message.text } | </span>
            <i>${ message.tag }</i>
            <strong>${ message.authorName }</strong>
        </div>
    <#else>
        <b>No message</b>
    </#list>
</@c.page>
