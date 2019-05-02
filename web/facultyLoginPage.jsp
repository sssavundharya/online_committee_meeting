<%-- 
    Document   : index
    Created on : Mar 18, 2019, 12:15:24 AM
    Author     : Sathish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Login</title>
  <!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.7.4/css/mdb.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
   <link rel="shortcut icon" href="D:/Mini-Project/FrontEnd/img/sourceImg/ksricon.png" type="image/x-icon">
    <style>
        form{
            height: 500px;
            width: 500px;
            margin-top: 94px;
            border-radius: 20px;
        }
        footer{
            margin-top:89px;
        }
        nav div{
            margin-left: 600px;
            font-size: 25px;
            color: white;
            font-family: 'Open Sans', sans-serif;
        }
        .login{
            width: 45%;
        }
    
    </style>
    </head>
        <body>
            <%
            
            String messages =  request.getParameter("message");

            %>
            <% if (messages != null){ %>

            <script> alert("<%= messages %>");</script>

            <%  messages = null; }

            %>
            <nav class="navbar navbar-dark indigo animated zoomIn">
                <div class="college-name">
                    K.S.R College of Engineering
                </div>
            </nav>
            <center>
                
                <form  action="FacultyServeletLogin" method="post" class="text-center border border-light p-5 animated zoomIn">
                    <p class="h4 mb-4">Faculty Login</p>
                    <input type="email" name="mail" class="form-control mb-4" placeholder="E-mail" required>
                    <input type="password" name="password" class="form-control mb-4" placeholder="Password" required>
                    <div class="d-flex justify-content-around">
                        <div>
                            <a href="" data-target=".modal" data-toggle="modal">Forgot password?</a>
                        </div>
                    </div>
                    <input class="btn btn-info btn-block my-4" type="submit" value="Log in">
                </form>
            </center>
                <div class="modal  fade" id="centralModalSm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                  aria-hidden="true">
                  <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h4 class="modal-title w-100" id="myModalLabel" style="text-align: center;">Forget Password</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body" style="text-align: center">
                        Please Contact Your Administrator
                      </div>
                    </div>
                  </div>
                </div>
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

