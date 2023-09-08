<%@page import="com.Entity.Jobs"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.Dao.JobDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User: Single Jobs</title>
        <%@include file="all_components/allcss.jsp"%>
    </head>
    <body>

        <c:if test="${empty userobj}">
            <c:redirect url="Login.jsp" />
        </c:if>
        <%@include file="all_components/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-12">

                    <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        JobDao dao = new JobDao(DBConnect.getConn());
                        Jobs j = dao.getJobById(id);
                    %>
                    <div class="card mt-5">
                        <div class="card-body">
                            <div class="text-center text-primary">
                                <i class="fa fa-clipboard fa-2x"></i>
                            </div>

                            <h6><%= j.getTitle()%></h6>
                            <p><%= j.getDescription()%></p>
                            <br>
                            <div class="row">
                                <div class="form-group col-md-3">
                                    <input type="text" class="form-control form-control-sm" value="Location: <%= j.getLocation()%>" readonly>
                                </div>

                                <div class="form-group col-md-3">
                                    <input type="text" class="form-control form-control-sm" value="Category: <%= j.getCategory()%>" readonly>
                                </div>
                            </div>
                            <br>
                            <h6>Publish Date:<%=j.getPdate().toString()%></h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
