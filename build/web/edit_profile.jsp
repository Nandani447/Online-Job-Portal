<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Page</title>
        <%@include file="all_components/allcss.jsp"%>
    </head>
    <body>
        <c:if test="${empty userobj}">
            <c:redirect url="Login.jsp"/>
        </c:if> 
        <%@include file="all_components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row p-4">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="text-center">
                                <i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
                                <h5>Edit Profile</h5>
                            </div>

                            <form action="UpdateProfileServlet" method="post">
                                <input type="hidden" name="id" value="${userobj.id}">
                                <div class="form-group p-2">
                                    <label>Enter Full Name</label>
                                    <input type="text" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="name" value="${userobj.name}">
                                </div>

                                <div class="form-group p-2">
                                    <label>Enter Qualification</label>
                                    <input type="text" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="qua" value="${userobj.qualification}">
                                </div>

                                <div class="form-group p-2">
                                    <label>Enter Email</label>
                                    <input type="text" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email" value="${userobj.email}">
                                </div>

                                <div class="form-group p-2">
                                    <label>Enter Password</label>
                                    <input type="password" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="ps" value="${userobj.password}">
                                </div>
                                <button type="submit" class="btn btn-primary mt-2" style="width: 350px; border-radius: 18px">Update</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="all_components/footer.jsp" %>
    </body>
</html>
