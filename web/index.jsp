
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <%@include file="all_components/allcss.jsp"%>
        <style type="text/css">
            .back-img{
                background: url('img/img11.png');
                width: 100%;
                height: 80vh;
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
    </head>
    <body>
        <%@include file="all_components/navbar.jsp" %>


        <div class="container-fluid back-img">
            <div class="text-center">
                <h1 class="text-white p-4">
                    <i class="fa fa-book" aria-hidden="true"></i>Online Job Portal
                </h1>
            </div>
        </div>

        <%@include file="all_components/footer.jsp" %>
    </body>
</html>
