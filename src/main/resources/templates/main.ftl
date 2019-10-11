<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <h1>Main page</h1>
    <div>
        <@l.logout />
        <span><a href="/user">User list</a></span>
    </div>
    <div>
        <form method="post" enctype="multipart/form-data">
            <input type="text" name="text" placeholder="Message"/>
            <input type="text" name="tag" placeholder="Tag"/>
            <input type="file" name="file">
            <button type="submit">Add</button>
            <input type="hidden" name="_csrf" value="${ _csrf.token }"/>
        </form>
    </div>
    <div>Messages list:</div>
    <form method="get" action="/main">
        <input type="text" name="filter" value="${filter?ifExists}"/>
        <button type="submit">Search</button>
    </form>
    <#list messages as message>
        <div>
            <b>${ message.id }</b>
            <span>${ message.text } | </span>
            <i>${ message.tag }</i>
            <strong>${ message.authorName }</strong>
            <div>
                <#if message.filename??>
                    <img src="/img/${message.filename}" alt="">
                </#if>
            </div>
        </div>
    <#else>
        <b>No message</b>
    </#list>
</@c.page>
