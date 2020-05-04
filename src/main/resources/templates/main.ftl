<#--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ~ Created by Vladislav Brezovsky at 2020
  ~ Contacts: https://t.me/vb_contacts
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->

<#import "parts/base.ftl" as b />
<@b.page>
    <h1>Main page</h1>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form class="form-inline" method="get" action="/main">
                <input class="form-control" type="text" name="filter"
                       value="${filter?ifExists}"
                       placeholder="Search by tag" />
                <button class="btn btn-primary ml-2" type="submit">
                    Search
                </button>
            </form>
        </div>
    </div>
    <#include "parts/messageEdit.ftl" />
    <#include "parts/messageList.ftl" />
</@b.page>
