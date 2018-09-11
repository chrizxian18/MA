<select id="${ select_id }" size="21" style="width:28em; margin-top:2%;" multiple="true">
<g:each in="${ list_items }" var="item">
	<option value="${ item[value_field?value_field:'id'] }">${ item[display_field] }</option>
</g:each>
</select><br/>
<g:if test="${list_items}">
<script>
    function ${select_id}_select_all(){
        var options = $$('select#${select_id} option');
        options.each(function(option){
            option.selected = true;
        })
    }
</script>
<span class="pager">
<a href="selectall" onclick="select_all('${select_id}');return false;">Select All</a>

&nbsp;|&nbsp;

<g:if test="${params.page.toString() != '1'}">
<a href="next" onclick="${update_script}(${new Long(params.page)-1});return false;">Prev</a>
</g:if>
<g:else>
Prev    
</g:else>

&nbsp;|&nbsp;

<g:if test="${params.pageCount.toString() != params.page.toString()}">
<a href="next" onclick="${update_script}(${new Long(params.page)+1});return false;">Next</a>
</g:if>
<g:else>
Next
</g:else>

&nbsp;|&nbsp;

&nbsp; Page <span id="${select_id}_page">${params.page}</span><g:if test="${params.pageCount}">/${params.pageCount}</g:if>
</g:if>
</span>
