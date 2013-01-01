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
                <%
                    int count = 0;
                    for (Entity result : pq.asIterable()) {
                        count = count + 1;
                %>
                    <tr>
                        <td>
                        </td>
                        <td><%= (String) result.getProperty("client_title")%></td>
                        <td><%= (String) result.getProperty("client_website")%></td>
                        <td>
                            <table class="icon">
                                <tr>
                                    <td class="icon"></td>
                                    <td class="icon">
                                        <a href="/?area=client&action=edit&id=<%=result.getKey().getId()%>">
                                            <img src="/img/edit.png" alt="Edit Category" border="0" />
                                        </a>
                                    </td>
                                    <td class="icon">
                                        <input type="hidden" name="delurl<%=count%>" id="delurl<%=count%>"
                                           value="/action?area=client&action=delete&id=<%=result.getKey().getId()%>"
                                        />
                                        <a id="confirmDialog" class="confirmDialog" onclick="javascript:sendurl(<%=count%>);" name="confirm">
                                            <img src="/img/cross.png" border="0" alt="Delete Category" />
                                        </a>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                <%}%>
            </tbody>
        </table>
        <jsp:include page="/jsp/confirmDialog.jsp"></jsp:include>
<%  } else {
%>
    <%= "There are no records by criteria"%>
<%  } %>