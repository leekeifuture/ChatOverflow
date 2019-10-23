<#include "security.ftl" />
<div id="message-list" class="card-columns">
    <#list messages as message>
        <div class="card my-3">
            <#if message.filename??>
                <img class="card-img-top" src="/img/${message.filename}" />
            </#if>
            <div class="m-2">
                <span>${message.text}</span><br />
                <i>#${message.tag}</i>
            </div>
            <div class="card-footer text-muted">
                <a href="/user-messages/${message.author.id}">
                    ${message.authorName}
                </a>
                <#if message.author.id == currentUserId>
                    <a class="btn btn-primary"
                       href="/user-messages/${message.author.id}?message=${message.id}">
                        Edit
                    </a>
                </#if>
            </div>
        </div>
    <#else>
        <b>No messages</b>
    </#list>
</div>
