<#include "security.ftl" />
<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">User name:</label>
            <div class="col-sm-6">
                <input class="form-control ${(usernameError??)?string('is-invalid', '')}"
                       type="text" name="username"
                       value="<#if user??>${user.username}</#if>"
                       placeholder="User name" />
                <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Password:</label>
            <div class="col-sm-6">
                <input class="form-control ${(passwordError??)?string('is-invalid', '')}"
                       type="password" name="password"
                       placeholder="Password" />
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
            </div>
        </div>
        <#if isRegisterForm>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Password:</label>
                <div class="col-sm-6">
                    <input class="form-control ${(password2Error??)?string('is-invalid', '')}"
                           type="password" name="password2"
                           placeholder="Retype password" />
                    <#if password2Error??>
                        <div class="invalid-feedback">
                            ${password2Error}
                        </div>
                    </#if>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">E-mail:</label>
                <div class="col-sm-6">
                    <input class="form-control ${(emailError??)?string('is-invalid', '')}"
                           type="email" name="email"
                           value="<#if user??>${user.email}</#if>"
                           placeholder="E-mail" />
                    <#if emailError??>
                        <div class="invalid-feedback">
                            ${emailError}
                        </div>
                    </#if>
                </div>
            </div>
        </#if>
        <button class="btn btn-primary" type="submit">
            <#if isRegisterForm>
                Register
            <#else>
                Sign In
            </#if>
        </button>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
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
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
        </form>
    <#else>

    </#if>
</#macro>
