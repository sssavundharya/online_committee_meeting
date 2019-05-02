<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
      <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Home Page</title>
  <!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.7.4/css/mdb.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
   <link rel="shortcut icon" href="D:/Mini-Project/FrontEnd/img/sourceImg/ksricon.png" type="image/x-icon">
      <link rel="shortcut icon" href="img/sourceImg/ksricon.png" type="image/x-icon">
      <style>
          
          .color-chnge {
              color: red;
          }
      .college-name{
    color: white;
    font-size: 30px;
    text-shadow: 2px 2px rgba(0,0,0,0.7);
    margin-left: 40vw;
}
.welcome-admin{
    font-size: 70px;
}
.welcome{
    text-align: center;
}
.card{
    height: 500px;
    margin-top: 30px;
    
}
footer{
    margin-top: 40px;
}
.that-time-user{
    float: right;
    color: white;
    font-size: 20px;
    }
 </style>
    </head>

    <body> 
        <% 
            String username = (String) request.getSession(false).getAttribute("username");
            if(username == null){
                response.sendRedirect("index.html");
            }
        %>
        <nav class="navbar navbar-dark indigo animated zoomIn">
            <div class="college-name">
                K.S.R College of Engineering
            </div>
            <div class="that-time-user" >
                <a href="./logoutServelet"><button class="btn btn-primary" style="color:white;" ="./logoutServelet" >Logout</button></a>
            </div>
        </nav>
        <div class="container animated zoomIn">
            <div class="welcome">
                <h2 class="welcome-admin"><span class="color-chnge">W</span>elcome <span class="current"><%= request.getParameter("message") %></span></h2>
            </div>
        </div>
        <div class="faculty animated fadeIn">
        <!--Faculty Card Options-->
            <div class="container">
                <div class="row">
                    <div class="col col-sm-4 col-lg-4 col-md-4">
                        <!-- Card -->
                        <div class="card">

                          <!-- Card image -->
                          <div class="view overlay">
                            <img class="card-img-top" src="Assets/images/meeting.png" alt="Lock images">
                            <a href="#!">
                              <div class="mask rgba-white-slight"></div>
                            </a>
                          </div>

                          <!-- Card content -->
                          <div class="card-body">

                            <!-- Title -->
                            <h4 class="card-title">Arrange Meeting</h4>
                            <!-- Text -->
                            <p class="card-text">Click the below button to arrange meeting time and Date</p>
                            <!-- Button -->
                            <a href="meetingSplitUp.jsp" class="btn btn-primary">Click Here</a>

                          </div>

                        </div>
                    <!-- Card -->
                    </div>
                    <div class="col col-sm-4 col-lg-4 col-md-4">
                        <!-- Card -->
                        <div class="card">

                          <!-- Card image -->
                          <div class="view overlay">
                            <img class="card-img-top" src="Assets/images/stud_manage.png" alt="Lock images" style="height:350px;">
                            <a href="#!">
                              <div class="mask rgba-white-slight"></div>
                            </a>
                          </div>

                          <!-- Card content -->
                          <div class="card-body">

                            <!-- Title -->
                            <h4 class="card-title">Manage Student</h4>
                            <!-- Text -->
                            <p class="card-text">Click the below button to Manage the Student</p>
                            <!-- Button -->
                            <a href="manageStudent.jsp" class="btn btn-primary">Click Here</a>

                          </div>

                        </div>
                    <!-- Card -->
                    </div>
                    <div class="col col-sm-4 col-lg-4 col-md-4">
                        <!-- Card -->
                        <div class="card">

                          <!-- Card image -->
                          <div class="view overlay">
                            <img class="card-img-top" src="Assets/images/report.png" alt="Lock images">
                            <a href="#!">
                              <div class="mask rgba-white-slight"></div>
                            </a>
                          </div>

                          <!-- Card content -->
                          <div class="card-body">

                            <!-- Title -->
                            <h4 class="card-title">Reports</h4>
                            <!-- Text -->
                            <p class="card-text">Click the below button to see the reports</p>
                            <!-- Button -->
                            <a href="reportSplitUp.jsp" class="btn btn-primary">Click Here</a>

                          </div>

                        </div>
                    <!-- Card -->
                    </div>
                </div>
            </div>
        </div>
        <!--footer with copyright-->
        <footer class="page-footer font-small blue animated zoomIn">
          <div class="footer-copyright text-center py-3">© 2016-2020 batch
            <a href="https://mdbootstrap.com/education/bootstrap/"> Department of CSE</a>
          </div>
            
        </footer>
        
       <!-- JQuery -->
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
            <!-- Bootstrap tooltips -->
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
            <!-- Bootstrap core JavaScript -->
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
            <!-- MDB core JavaScript -->
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.7.4/js/mdb.min.js"></script>
    </body>

</html>

