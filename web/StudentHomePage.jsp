<%-- 
    Document   : StudentLogin
    Created on : Mar 19, 2019, 1:03:26 AM
    Author     : Sathish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
      <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Login</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

  <!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.7.4/css/mdb.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link rel="shortcut icon" href="img/sourceImg/ksricon.png" type="image/x-icon">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
      <style>
          .color-chnge{
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
    margin-top: 52px;
}
.that-time-user{
    float: right;
    color: white;
    font-size: 20px;
    }
     </style>
    </head>
    <%
            
            String messages =  request.getParameter("message");
            String arr[] = messages.split(",");

    %>
    <p class="member-or-not"><%= arr[1] %></p>
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
        <!--ADMIN-->
        <div class="container animated zoomIn">
            <div class="welcome">
                <h2 class="welcome-admin"><span class="color-chnge">W</span>elcome <span class="current"><%= arr[0] %></span></h2>
            </div>
        </div>
        <div class="student animated fadeIn">
        <!--Student Card Options-->
            <div class="container">
                <div class="row">
                    <div class="col col-sm-4 col-lg-4 col-md-4">
                        <!-- Card -->
                        <div class="card" data-toggle="tooltip" title="Only Committee members allowed to access this">

                          <!-- Card image -->
                          <div class="view overlay">
                            <img class="card-img-top" src="Assets/images/join.png" alt="Lock images">
                            <a href="#!" >
                              <div class="mask rgba-white-slight"></div>
                            </a>
                          </div>

                          <!-- Card content -->
                          <div class="card-body">

                            <!-- Title -->
                            <h4 class="card-title">Join Session</h4>
                            <!-- Text -->
                            <p class="card-text">Click the below button to join the session</p>
                            <!-- Button -->
                            <a href="chatForum.jsp" class="btn btn-primary member" >Click Here</a>

                          </div>

                        </div>
                    <!-- Card -->
                    </div>
                    <div class="col col-sm-4 col-lg-4 col-md-4">
                        <!-- Card -->
                        <div class="card">

                          <!-- Card image -->
                          <div class="view overlay">
                            <img class="card-img-top" src="Assets/images/feedback.png" alt="Lock images">
                            <a href="#!">
                              <div class="mask rgba-white-slight"></div>
                            </a>
                          </div>

                          <!-- Card content -->
                          <div class="card-body">

                            <!-- Title -->
                            <h4 class="card-title">Feedback</h4>
                            <!-- Text -->
                            <p class="card-text">Click the below button to give Feedback about meeting</p>
                            <!-- Button -->
                            <a href="feedBackform.jsp" class="btn btn-primary">Click Here</a>

                          </div>

                        </div>
                    <!-- Card -->
                    </div>
                </div>
            </div>
        </div>
            <script>
                document.querySelector(".member-or-not").style.display = "none";
                var mem = document.querySelector(".member-or-not").textContent;
                if(mem==0){
                    document.querySelector(".member").classList.add("disabled");
                    showToolTip();
                }
            </script>
            <script>
                function showToolTip(){
                    $(document).ready(function(){
                        $('[data-toggle="tooltip"]').tooltip(); 
                 
                        });
                    }
            </script>
            
        <footer class="page-footer font-small blue animated zoomIn">
          <div class="footer-copyright text-center py-3">© 2016-2020 batch
            <a href="https://mdbootstrap.com/education/bootstrap/"> Department of CSE</a>
          </div>
            
        </footer>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!--            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>-->
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.7.4/js/mdb.min.js"></script>
    </body>

</html>

