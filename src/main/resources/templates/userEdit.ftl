<#--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ~ Created by Vladislav Brezovsky at 2020
  ~ Contacts: https://t.me/vb_contacts
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->

<#import "parts/base.ftl" as b />
<@b.page>
    <h1>Edit user</h1>
    <form action="/user" method="post">
        <input type="text" name="username" value="${user.username}" />
        <#list roles as role>
            <div>
                <label>
                    <input type="checkbox"
                           name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}
                </label>
            </div>
        </#list>
        <input type="hidden" value="${user.id}" name="userId" />
        <button type="submit">Save</button>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</@b.page>
