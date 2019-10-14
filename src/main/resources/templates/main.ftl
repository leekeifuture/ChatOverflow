<#import "parts/common.ftl" as c>
<@c.page>
    <h1>Main page</h1>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <input class="form-control" type="text" name="filter"
                       value="${filter?ifExists}"
                       placeholder="Search by tag"/>
                <button type="submit" class="btn btn-primary ml-2">
                    Search
                </button>
            </form>
        </div>
    </div>
    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample"
       role="button" aria-expanded="false" aria-controls="collapseExample">
        Add new message
    </a>
    <div class="collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input class="form-control" type="text" name="text"
                           placeholder="Message"/>
                </div>
                <div class="form-group">
                    <input class="form-control" type="text" name="tag"
                           placeholder="Tag"/>
                </div>
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" name="file" id="customFile">
                        <label class="custom-file-label" for="customFile">
                            Choose file
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Add</button>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            </form>
        </div>
    </div>
    <div class="card-columns">
        <#list messages as message>
            <div class="card my-3">
                <#if message.filename??>
                    <img src="/img/${message.filename}" class="card-img-top">
                </#if>
                <div class="m-2">
                    <span>${message.text} | </span>
                    <i>${message.tag}</i>
                </div>
                <div class="card-footer text-muted">
                    ${message.authorName}
                </div>
            </div>
        <#else>
            <b>No message</b>
        </#list>
    </div>
</@c.page>
