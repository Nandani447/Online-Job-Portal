<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.Entity.Jobs"%>
<%@page import="com.Dao.JobDao"%>
<%@page import="com.DB.DBConnect"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User: View Jobs</title>
        <%@include file="all_components/allcss.jsp"%>
    </head>
    <body>
             <c:if test="${empty userobj}">
                   <c:redirect url="Login.jsp"/>
               </c:if> 
        <%@include file="all_components/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h5 class="text-center text-primary">All Jobs</h5>
                    <%
                        String loc = request.getParameter("loc");
                        String cat = request.getParameter("cat");
                        String msg = "";

                        JobDao dao = new JobDao(DBConnect.getConn());
                        List<Jobs> list = null;
                        if ("lo".equals(loc) && "ca".equals(cat)) {
                            list = new ArrayList<Jobs>();
                            msg = "Job Not Avaliable";
                        } else if ("lo".equals(loc) || "ca".equals(cat)) {
                            list = dao.getJobsORLocationAndCat(cat, loc);
                        } else {
                            list = dao.getJobsAndLocationAndCat(cat, loc);
                        }
                        if (list.isEmpty()) {
                    %>
                    <h4 class="text-center text-danger">Job Not Avaliable</h4>
                    <%
                        }
                        if (list != null) {
                            for (Jobs j : list) {
                    %>
                    <div class="card mt-2">
                        <div class="card-body">
                            <div class="text-center text-primary">
                                <i class="fa fa-clipboard fa-2x"></i>
                            </div>
                            <h6><%=j.getTitle()%></h6>
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
                            <h6>Publish Date:<%=j.getPdate().toString()%></h6>
                            <div class="text-center">
                                <a href="One_View.jsp?id=<%=j.getId()%>" class="btn btn-sm bg-success text-white">View More</a>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    } else {
                    %>
                    <h4 class="text-center text-danger"><%= msg%></h4>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html >
