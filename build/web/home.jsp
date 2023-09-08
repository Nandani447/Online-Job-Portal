<%@page import="java.util.List"%>
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
        <title>User: View Jobs</title>
        <%@include file="all_components/allcss.jsp"%>
        <style>
            .btn1{
                margin-top: 1.9rem;
            }
        </style>
    </head>
    <body>
        <c:if test="${empty userobj}">
            <c:redirect url="Login.jsp" />
        </c:if>
        <%@include file="all_components/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h5 class="text-center text-primary">All Jobs</h5>

                    <c:if test="${not empty succMsg}">
                        <h4 class="text-center text-success">${succMsg}</h4>
                        <c:remove var="succMsg"/>
                    </c:if>

                    <div class="card">
                        <div class="card-body">

                            <form class="form-inline" action="More_View.jsp" method="get">

                                <div class="row p-2">
                                    <div class="form-group col-md-5 mt-1">
                                        <h5>Location</h5>
                                        <select name="loc" class="custom-select form-control" id="inlineFormCustomSelectPref">
                                            <option selected value="lo">Choose...</option>
                                            <option value="Mumbai">Mumbai</option>
                                            <option value="Gurgao">Gurgao</option>
                                            <option value="Maharastra">Maharastra</option>
                                            <option value="Banglore">Banglore</option>
                                            <option value="Pune">Pune</option>
                                            <option value="Hyderabad">Hyderabad</option>
                                            <option value="Chennai">Chennai</option>
                                            <option value="Noida">Noida</option>
                                        </select>
                                    </div>

                                    <div class="form-group col-md-5 mt-1">
                                        <h5>Category</h5>
                                        <select name="cat" class="custom-select form-control" id="inlineFormCustomSelectPref">
                                            <option selected value="ca">Choose...</option>
                                            <option value="IT">IT</option>
                                            <option value="Developer">Developer</option>
                                            <option value="Full Stack Developer">Full Stack Developer</option>
                                            <option value="Front End Developer">Front End Developer</option>
                                            <option value="Engineer">Engineer</option>
                                            <option value="Back End Developer">Back End Developer</option>
                                            <option value="Banking">Banking</option>
                                        </select> 
                                    </div>

                                    <div class="btn1 form-group col-md-2">
                                        <button class="btn btn-success">Submit</button>
                                    </div>
                                </div>

                            </form>

                        </div>
                    </div>
                    <%
                        JobDao dao = new JobDao(DBConnect.getConn());
                        List<Jobs> list = dao.getAllJobsForUser();
                        for (Jobs j : list) {
                    %>
                    <div class="card mt-2">
                        <div class="card-body">
                            <div class="text-center text-primary">
                                <i class="fa fa-clipboard fa-2x"></i>
                            </div>

                            <h6><%=j.getTitle()%></h6>

                            <%
                                if (j.getDescription().length() > 0 && j.getDescription().length() < 120) {
                            %>  
                            <p><%= j.getDescription()%>.</p>
                            <%
                            } else {
                            %>
                            <p><%= j.getDescription().substring(0, 120)%>...</p>
                            <%
                                }
                            %>

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
                            <h6>Publish Date:
                                <%=j.getPdate().toString()%></h6>
                            <div class="text-center">
                                <a href="One_View.jsp?id=<%= j.getId()%>" class="btn btn-sm bg-success text-white">View More</a>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>
