<%--
  Handsoft.

  User: ikotelkin
  Date: 30.12.12
  Time: 22:27

  Description:
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
    <head>
        <title>Admin Home Page</title>

        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <!-- 1140px Grid styles for IE -->
        <!--[if lte IE 9]><link rel="stylesheet" href="/css/ie.css" type="text/css" media="screen" /><![endif]-->
        <!-- The 1140px Grid - http://cssgrid.net/ -->
        <link rel="stylesheet" href="/css/1140.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="/css/basestyles.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="/css/styles.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="/js/tabs/ui.tabs.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="/js/tableSorter/blue/style.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="/js/modal/css/confirm.css" type="text/css" media="screen" />

        <script type="text/javascript" src="/js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="/js/jquery.validate.min.js"></script>
        <script type="text/javascript" src="/js/tabs/ui.tabs.js"></script>
        <script type="text/javascript" src="/js/modal/js/jquery.simplemodal.js"></script>
        <script type="text/javascript" src="/js/modal/js/confirm.js"></script>

    </head>
    <body>
        <div class="container header">
            <div class="row">
                <div class="threecol">
                    <div class="siteLogo">
                        <img alt="" src="/img/logo.png">
                    </div>
                </div>
                <div class="threecol"></div>
                <div class="sixcol last">
                    <div class="siteTitle">
                        <img alt="" src="/img/admin_title.png">
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="threecol">
                    <div class="boxSection leftMenu">
                        <ul>
                            <li class="adminAreaGroup">
                                <a href="javascript:void();">History</a>
                                <ul>
                                    <li>
                                        <a href="/?area=client&action=list">Clients</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void();">Projects</a>
                                    </li>
                                </ul>
                            </li>
                            <hr>
                            <li class="adminAreaGroup">
                                <a href="javascript:void();">Content</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="ninecol last">
                    <div class="boxSection adminContent">
                        <%
                            String area = request.getParameter("area");
                            String action = request.getParameter("action");
                            String id = request.getParameter("id");

                            if (id == null) {
                                id = "";
                            }
                            if (area != null && action != null) {
                                String inc = "/jsp/" + area + "/dsp_" + action + ".jsp";
                        %>
                                <jsp:include page="<%=inc%>">
                                    <jsp:param name="id" value="<%=id%>"></jsp:param>
                                </jsp:include>
                        <%
                            } else {
                        %>
                                <h1>Welcome to Admin Home Page</h1>
                        <%  }%>
                    </div>
                </div>
            </div>
        </div>

        <div class="container footer">
            <div class="row">
                <div class="twelvecol last">
                </div>
            </div>
        </div>
    </body>
</html>