<#assign
know = Session.SPRING_SECURITY_CONTEXT?? />
<#if know>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    name = user.getUsername()
    userId = user.getId()
    isAdmin = user.isAdmin()
    currentUserId = user.getId() />
<#else>
    <#assign
    isAdmin = false
    currentUserId = -1 />
</#if>
