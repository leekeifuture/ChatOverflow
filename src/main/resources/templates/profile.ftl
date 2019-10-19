<#import "parts/common.ftl" as c />
<@c.page>
    <h1 class="mb-1">${username}</h1>
    <h5 style="color: red;">${message?ifExists}</h5>
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
                <input type="email" name="email" class="form-control"
                       placeholder="E-mail" value="${email!''}" />
            </div>
        </div>
        <button class="btn btn-primary" type="submit">Save</button>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</@c.page>
