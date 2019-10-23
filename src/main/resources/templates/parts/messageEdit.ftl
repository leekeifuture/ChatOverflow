<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample"
   role="button" aria-expanded="false" aria-controls="collapseExample">
    Message editor
</a>
<div class="collapse <#if message??>show</#if>" id="collapseExample">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input class="form-control ${(textError??)?string('is-invalid', '')}"
                       type="text"
                       value="<#if message??>${message.text}</#if>"
                       name="text"
                       placeholder="Message" />
                <#if textError??>
                    <div class="invalid-feedback">
                        ${textError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <input class="form-control" type="text"
                       value="<#if message??>${message.tag}</#if>"
                       name="tag"
                       placeholder="Tag" />
                <#if tagError??>
                    <div class="invalid-feedback">
                        ${tagError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input id="customFile" type="file" name="file" />
                    <label class="custom-file-label" for="customFile">
                        Choose file
                    </label>
                </div>
            </div>
            <div class="form-group">
                <button class="btn btn-primary" type="submit">Save message
                </button>
            </div>
            <input type="hidden" name="id"
                   value="<#if message??>${message.id}</#if>" />
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
        </form>
    </div>
</div>
