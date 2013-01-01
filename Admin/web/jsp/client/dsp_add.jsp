<%
    String id = request.getParameter("id");
%>

<jsp:include page="/jsp/client/dsp_edit.jsp">
    <jsp:param name="id" value="<%=id%>"></jsp:param>
</jsp:include>