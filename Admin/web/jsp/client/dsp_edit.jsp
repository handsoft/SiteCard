<%@ page import="com.google.appengine.api.datastore.FetchOptions" %>
<%@ page import="com.handsoft.domain.client.ClientDao" %>
<%@ page import="com.google.appengine.api.datastore.PreparedQuery" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>

<%
    String param = request.getParameter("id");
    Integer id = 0;
    if (param != null && !"".equals(param)) {
        id = Integer.parseInt(param);
    }

    String client_title = "";
    String client_website = "";

    if (id > 0) {
        com.handsoft.domain.client.ClientDao client = new com.handsoft.domain.client.ClientDao();
        PreparedQuery pq = client.getOne(id);
        Entity result = pq.asSingleEntity();

        client_title = result.getProperty("client_id").toString();
        client_website = result.getProperty("client_website").toString();
    }

//    if (pq.asList(FetchOptions.Builder.withOffset(0)).size() > 0) {

//    }
%>

<script type="text/javascript">
	$(function() {
		$('#editBox ul').tabs({ fxSlide: true, fxSpeed: 'fast' });

        $("#frmEdit").validate({
            ignore: '',
            rules:{
                client_title: {
                    required: true
                }
            }
        });

	});
</script>

<form method="get" action="/action" name="frmEdit" id="frmEdit" >
    <input type="hidden" name="id" value="<%=id%>" />
    <input type="hidden" name="area" value="client" />
    <div class="contactform">
	    <input type="submit" name="submit" id="submit" class="button" value="Save" />
        <div id="editBox">
            <ul>
                <li><a href="#tab-1"><span>Simple</span></a></li>
            </ul>

            <div id="tab-1">
                <fieldset>
                    <legend>&nbsp;Client Information&nbsp;</legend>
                    <table width="100%" border="0" cellpadding="0">
                        <colgroup>
                            <col style="width:20%" />
                            <col style="width:50%" />
                            <col style="width:30%" />
                        </colgroup>
                        <tr>
                            <td class="label"><label for="client_title" class="left">Title<span class="required">*</span>:</label></td>
                            <td colspan="2"><input type="text" name="client_title" id="client_title" class="field" value="<%=client_title%>" /></td>
                        </tr>
                        <tr>
                            <td class="label"><label for="client_website" class="left">Website:</label></td>
                            <td colspan="2"><input type="text" name="client_website" id="client_website" class="field" value="<%=client_website%>" /></td>
                        </tr>
                    </table>
                    <p></p>
                </fieldset>
            </div>
        </div>
    </div>
</form>
