<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Query" %>
<%@ page import="java.util.List" %>

<%@ page import="javax.annotation.Resource"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 

<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
             <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" > 
             <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js" ></script> 
             <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" ></script> 
<Style>

body {
    padding-top: 70px; /* Required padding for .navbar-fixed-top. Change if height of navigation changes. */
}

.thumb {
    margin-bottom: 30px;
}

footer {
    margin: 50px 0;
}
</Style>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Charlotte Hospitality Management System</title>
 
    <link href="css/bootstrap.min.css" rel="stylesheet">


    <link href="css/thumbnail-gallery.css" rel="stylesheet">
</head>
<body>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/springexamples"
     user="root"  password=""/>
     

 
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Appointments</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="#">Calender</a>
                    </li>
                    <li>
                        <a href="#">Room</a>
                    </li>
                    <li>
                        <a href="/springmvclogin/forms/messageForm.html">Message</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">

        <div class="row">

            <div class="col-lg-12">
                <h1 class="page-header">Rooms</h1>
            </div>

<sql:query dataSource="${snapshot}" var="result">
SELECT * from room;
</sql:query>






<c:forEach var="row" items="${result.rows}">

<c:choose>
    <c:when test="${row.status == '0'}">
            <div class="col-lg-3 col-md-4 col-xs-6 thumb">
                <a class="thumbnail" href="#" id="${row.RoomNo}" style="color:blue;" data-toggle="modal" data-target="#myModal">
                	<div>
                		<c:out value="${row.RoomNo}"/>
                	</div>
                </a>
            </div>
        <br />
    </c:when>    
    <c:otherwise>
            <div class="col-lg-3 col-md-4 col-xs-6 thumb">
                <a class="thumbnail" href="#" id="${row.RoomNo}" style="color:red;" data-toggle="modal" data-target="#myModal_reserved">
                	<div>
                	
                		<c:out value="${row.RoomNo}"/>
                	</div>
                	<div class="modadal-body" id="modadal-body" style="display:none;">
                	
<sql:query dataSource="${snapshot}" var="result1">
SELECT * from room_booking where RoomNo="<c:out value="${row.RoomNo}"/>";
</sql:query>
<c:forEach var="row" items="${result1.rows}">
<b>Room Information:</b>
<br><br>

Room Number: <c:out value="${row.RoomNo}"/>
<br>
Patient Name: <c:out value="${row.patient_name}"/>
<br>
Doctor Incharge: <c:out value="${row.doctor_name}"/>
<br>
Start Date: <c:out value="${row.start_date}"/>
<br>
End Date: <c:out value="${row.end_date}"/>
<br>
</c:forEach>



        			</div>
                </a>
            </div>
        <br />
    </c:otherwise>
</c:choose>


   </c:forEach>
   <!--          <div class="col-lg-3 col-md-4 col-xs-6 thumb">
                <a class="thumbnail" href="#" data-toggle="modal" data-target="#myModal">
                    <img class="img-responsive" src="http://placehold.it/400x300" alt="">
                </a>
            </div>
            
         -->    
            
        </div>
        


<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <p>
          
          <form action="">
         Enter Patient Name:<input type="text" name="patientname" id="patientname"/><br><br>
         Enter Doctor's Name:<input type="text" name="doctorname" id="doctorname"/><br><br>
         Enter Start Date:<input type="text" name="startdate" id="startdate"/><br><br>
         Enter End Date:<input type="text" name="enddate" id="enddate"/><br><br>
         <button type="submit" value="submit">Enter!</button>
          
          </form>
          
          </p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  

  <div class="modal fade" id="myModal_reserved" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body" id="modal-body">
        

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
  
        <hr>

   <!--      <footer>
            <div class="row">
                <div class="col-lg-12">
                </div>
            </div>
        </footer>
 -->
    </div>
    <script src="js/jquery.js"></script>

    <script src="js/bootstrap.min.js"></script>
<!-- 
    <script>
        $('#myModal_reserved').on('show.bs.modal', function(e) {
            
            var $modal = $(this),
                esseyId = e.relatedTarget.id;

                    $modal.find('.edit-content').html(esseyId);
        })
    <script>
 -->
 <script>

            var v1=document.getElementById('modadal-body').innerHTML;
            document.getElementById('modal-body').innerHTML = v1;
    </script>
</body>

</html>
