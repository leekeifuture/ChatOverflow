<#include "security.ftl">
<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">User Name:</label>
            <div class="col-sm-6">
                <input type="text" name="username" class="form-control"
                       placeholder="User name"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Password:</label>
            <div class="col-sm-6">
                <input type="password" name="password" class="form-control"
                       placeholder="Password"/>
            </div>
        </div>
        <button class="btn btn-primary" type="submit">
            <#if isRegisterForm>
                Register
            <#else>
                Sign In
            </#if>
        </button>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    </form>
    <#if !isRegisterForm>
        <form action="/registration">
            <button class="btn btn-primary mt-1">Register</button>
        </form>
    </#if>
</#macro>

<#macro logout>
    <#if know>
        <form action="/logout" method="post">
            <button class="btn btn-primary" type="submit">Sign Out</button>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        </form>
    <#else>

    </#if>
</#macro>
