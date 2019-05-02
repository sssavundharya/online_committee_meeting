<%-- 
    Document   : manageStudent
    Created on : Mar 30, 2019, 9:41:50 PM
    Author     : Sathish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Manage Students</title>
  <!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.7.4/css/mdb.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
  <link rel="shortcut icon" href="img/sourceImg/ksricon.png" type="image/x-icon">

        <style>
            form{
                height: 530px;
                width: 700px;
                margin-top: 50px;
                
            } 
            nav div{
                margin-left: 600px;
                font-size: 25px;
                color: white;
                font-family: 'Open Sans', sans-serif;
            }
            h3{
                margin-top: 10px;
                font-size: 50px;
                color: white;
                text-shadow: 2px 2px 10px rgba(0,0,0,0.9);
            }
            footer{
                margin-top: 95px;
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
        <div class="animated fadeIn">
            <div class="container">
                <center>
                    <form method="post" action="manageStudentServelet" class="text-center border border-light p-5 animated zoomIn">
                        <p class="h4 mb-4">Manage Students</p>
                        <input type="text" name="reg_num" id="regNum" class="form-control mb-4" placeholder="Enter Register Number">
                        <br><br>
                        <input type="text" name="member" id="memb" class="form-control mb-4" placeholder="1 or 0">
                        <input class="btn btn-info btn-block my-4" type="submit" onclick="return check()" value="Change">
                    </form>
                </center>
            </div>
        </div>
        <footer class="page-footer font-small blue animated zoomIn">
          <div class="footer-copyright text-center py-3">© 2016-2020 batch
            <a href="https://mdbootstrap.com/education/bootstrap/"> Department of CSE</a>
          </div>       
        </footer>
            <script>
                
                if(window.location.href.length ==44){
                    
                }
                else{
                
                    var pathLocation = window.location.href;
                    var indexOJsp = pathLocation.indexOf(".jsp");
                    window.location.href = pathLocation.substr(0,indexOJsp+4);
                    
                
            }
            
                
                function check(){
                    var re = document.getElementById("regNum").value;
                    var me= document.getElementById("memb").value;
                    reg = parseInt(re);
                    mem = parseInt(me);
                    if(isNaN(re) || isNaN(me)){
                        alert("Enter number only");
                    }
                    else{
                        if(re.length==7 && (mem==1 || mem==0)){
                             
                            return true;

                        }else{

                            alert("enter valid number");
                            return false;
                   


                        }
                    }
                    
                }
                
            </script>
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
