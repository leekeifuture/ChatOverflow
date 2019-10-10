<#import "parts/common.ftl" as c>

<@c.page>
    <form action="/user" method="post">
        <input type="text" name="username" value="${user.username}">
        <#list roles as role>
            <div>
                <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}></label>
            </div>
        </#list>
        <button type="submit">Save</button>
        <input type="hidden" name="_csrf" value="${ _csrf.token }"/>
    </form>
</@c.page>