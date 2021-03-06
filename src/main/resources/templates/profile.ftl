<#--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ~ Created by Vladislav Brezovsky at 2020
  ~ Contacts: https://t.me/vb_contacts
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->

<#import "parts/base.ftl" as b />
<@b.page>
    <h1 class="mb-1">${username}</h1>
    <h5>${message?ifExists}</h5>
    <form method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Password:</label>
            <div class="col-sm-6">
                <input class="form-control" type="password" name="password"
                       placeholder="Password" />
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">E-mail:</label>
            <div class="col-sm-6">
                <input class="form-control" type="email" name="email"
                       placeholder="E-mail" value="${email!''}" />
            </div>
        </div>
        <button class="btn btn-primary" type="submit">Save</button>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</@b.page>
