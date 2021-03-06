<#--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ~ Created by Vladislav Brezovsky at 2020
  ~ Contacts: https://t.me/vb_contacts
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->

<#assign
know = Session.SPRING_SECURITY_CONTEXT?? />
<#if know>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    name = user.getUsername()
    isAdmin = user.isAdmin()
    currentUserId = user.getId() />
<#else>
    <#assign
    isAdmin = false
    currentUserId = -1 />
</#if>
