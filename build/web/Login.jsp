

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <%@include file="all_components/allcss.jsp"%>

    </head>
    <body style="background-color: buttonface">
        <%@include file="all_components/navbar.jsp" %>

        <div class="container-fluid">
            <div class="row p-5">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="text-center">
                                <i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
                                <h5>Login Page</h5>
                            </div>

                            <c:if test="${not empty succMsg}">
                                <h4 class="text-center text-danger">${succMsg}</h4>
                                <c:remove var="succMsg" />
                            </c:if>

                            <form action="LoginServlet" method="post">

                                <div class="form-group p-2">
                                    <label>Enter Email</label>
                                    <input type="email" required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email">    
                                </div>
                                <div class="form-group p-2">
                                    <label for="exampleInputPassword">Enter Password</label>
                                    <input type="password" required="required" class="form-control" id="exampleInputPassword" aria-describedby="emailHelp" name="password">    
                                </div>

                                <button type="submit" class="btn btn-primary m-2" style="width: 350px; border-radius: 18px">Login</button>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
