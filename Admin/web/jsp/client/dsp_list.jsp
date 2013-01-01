<%@ page import="com.google.appengine.api.datastore.PreparedQuery" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@ page import="com.handsoft.domain.client.ClientDao" %>
<%@ page import="com.google.appengine.api.datastore.FetchOptions" %>

<jsp:include page="/jsp/client/dsp_wrapper.jsp"></jsp:include>

<%
    ClientDao client = new ClientDao();
    PreparedQuery pq = client.getAll();

    if (pq.asList(FetchOptions.Builder.withOffset(0)).size() > 0) {
%>

        <table class="tablesorter">
            <thead>
                <tr>
                    <th style="width: 20%;">Logo</th>
                    <th style="width: 35%;">Title</th>
                    <th style="width: 30%;">Website</th>
                    <th style="width: 15%;">Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (Entity result : pq.asIterable()) { %>
                    <tr>
                        <td>
                        </td>
                        <td><%= (String) result.getProperty("client_title")%></td>
                        <td><%= (String) result.getProperty("client_website")%></td>
                        <td>
                            <%--<table class="icon">--%>
                                <%--<tr>--%>
                                    <%--<td>--%>

                                    <%--</td>--%>
                                    <%--<td class="icon">--%>
                                        <%--<a href="#fa('edit')#category_id/#category_id#/"><img src="inc/icons/edit.png" alt="Edit Category" border="0" /></a>--%>
                                    <%--</td>--%>
                                    <%--<td class="icon">--%>
                                        <%--<input type="hidden" name="delurl#qList.currentRow#" id="delurl#qList.currentRow#" value="#fa('delete')#category_id/#category_id#/" />--%>
                                        <%--<a id="confirmDialog" class="confirmDialog" onclick="javascript:sendurl(#qList.currentRow#);" name="confirm"><img src="inc/icons/cross.png" border="0" alt="Delete Category" /></a>--%>
                                    <%--</td>--%>
                                <%--</tr>--%>
                            <%--</table>--%>
                        </td>
                    </tr>
                <%}%>
            </tbody>
        </table>
<%  } else {
%>
    <%= "There are no records by criteria"%>
<%  } %>