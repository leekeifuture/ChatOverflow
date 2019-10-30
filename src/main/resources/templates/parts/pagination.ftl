<nav aria-label="...">
    <ul class="pagination">

        <li class="page-item <#if pages[0] == currentPage>disabled</#if>">
            <a class="page-link" href="?page=${currentPage - 1}" tabindex="-1">
                Previous
            </a>
        </li>

        <#list pages as page>
            <li class="page-item <#if page == currentPage>active</#if>">
                <a class="page-link" href="?page=${page}">
                    ${page}
                    <#if page == currentPage>
                        <span class="sr-only">(current)</span>
                    </#if>
                </a>
            </li>
            <#assign lastPage = page />
        </#list>

        <li class="page-item <#if lastPage == currentPage>disabled</#if>">
            <a class="page-link" href="?page=${currentPage + 1}">
                Next
            </a>
        </li>

    </ul>
</nav>
