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
        <title>Edit Job</title>
        <%@include file="all_components/allcss.jsp"%>
    </head>
    <body>
        <c:if test="${userobj.role ne 'admin'}">
            <c:redirect url="Login.jsp"></c:redirect>
        </c:if>
        <%@include file="all_components/navbar.jsp" %>

        <div class="container p-2">
            <div class="col-md-10 offset-md-1">
                <div class="card">
                    <div class="card-body">
                        <div class="text-center text-success">
                            <i class="fa fa-users fa-3x"></i>

                            <% int id = Integer.parseInt(request.getParameter("id"));
                                JobDao dao = new JobDao(DBConnect.getConn());
                                Jobs j = dao.getJobById(id);
                            %>

                            <h5>Edit Jobs</h5>
                        </div>
                        <form action="EditJobServlet" method="post">

                            <input type="hidden" value="<%= j.getId()%>" name="id">

                            <div class="form-group">
                                <label>Enter Title</label><input type="text" name="title" required class="form-control" value="<%= j.getTitle()%>">
                            </div>
                            <div class="row p-2">
                                <div class="form-group col-md-4">
                                    <label>Location</label> <select name="location" class="custom-select form-control" id="inlineFormCustomSelectPref">
                                        <option value="<%= j.getLocation()%>"><%= j.getLocation()%></option>
                                        <option value="Mumbai">Mumbai</option>
                                        <option value="Hyderabad">Hyderabad</option>
                                        <option value="Pune">Pune</option>
                                        <option value="Banglore">Banglore</option>
                                        <option value="Maharastra">Maharastra</option>
                                        <option value="Chennai">Chennai</option>
                                        <option value="Gurgao">Gurgao</option>
                                        <option value="Noida">Noida</option>

                                    </select>
                                </div>

                                <div class="form-group col-md-4">
                                    <label>Category</label> <select name="category" class="custom-select form-control" id="inlineFormCustomSelectPref">
                                        <option value="<%= j.getCategory()%>"><%= j.getCategory()%></option>
                                        <option value="IT">IT</option>
                                        <option value="Developer">Developer</option>
                                        <option value="Banking">Banking</option>
                                        <option value="Engineer">Engineer</option>
                                        <option value="Full Stack Developer">Full Stack Developer</option>
                                        <option value="Front End Developer">Front End Developer</option>
                                        <option value="Backend End Developer">Backend End Developer</option>

                                    </select>
                                </div>

                                <div class="form-group col-md-4">
                                    <label>Status</label> <select class="form-control" name="status">
                                        <option class="Active" value="<%= j.getStatus()%>"><%= j.getStatus()%></option>
                                        <option class="Active" value="Active">Active</option>
                                        <option class="Inactive" value="Inactive">Inactive</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Enter Description</label>
                                <textarea required rows="6" cols="" name="desc" class="form-control"><%= j.getDescription()%></textarea>
                            </div>
                            <button class="btn btn-success p-2 m-2">Update Job</button>
                        </form>
                    </div>
                </div>
            </div>
    </body>
</html>
