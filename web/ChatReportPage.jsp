

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
      <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Meeting Report</title>
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
          .logo_college{
              height: 120px;
              background-repeat: no-repeat;
              margin-left: 200px;
          }
      .college-name{
        color: white;
        font-size: 30px;
        text-shadow: 2px 2px rgba(0,0,0,0.7);
        margin-left: 40vw;
    }
    footer{
        margin-top: 290px;
        width: 100%;
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
        </nav>
        <div class="container" id="el">
            <center>
                <div class="logo_college" style="background-image: url('Assets/images/college_logo.png');"></div>
            </center>
            <center class="mt-4"><h2 style="color:blue;font-weight: 500;">Meeting Report</h2></center>
            <center  class= "mt-4" style="margin-left:10px;">
            <div class="row">
                <div class="col-4">
                    <h5>Dept : CSE</h5>
                </div>
                <div class="col-4">
                    <h5>Year : 3rd</h5>
                </div>
                <div class="col-4">
                    <h5>Sec : B</h5>
                </div>
            </div>
            </center>
            <div class="row mt-4" id="searchcontent" style="margin-left:250px">
                <div class="col mt-2">
                    <input type="date" class="form-control from" placeholder="from">
                </div>
                <div class="col">
                    <button class="btn btn-md btn-primary " onclick="getData()">Get Result</button>
                </div>
    
            </div><br><br><br>
            <div class="report">
                <ol class="ul_list"></ol>
            </div>
            <center id="final"><button class="btn btn-outline-success btn-lg report-button"  onclick="CovertPDF('el')">Report Generate</button></center>
            <br><br><br>
            <center  class= "mt-4 sign-content" style="margin-left:10px;">
                <div class="row ">
                    <div class="col-4"><h5>Class Advisor</h5></div>
                    <div class="col-4"><h5>Class Coordinator</h5></div>
                    <div class="col-4"><h5>Head Of the Depatment</h5></div>
                </div>
            </center>
        </div>
        
        <!--footer with copyright-->
        <footer class="page-footer font-small blue animated zoomIn">
          <div class="footer-copyright text-center py-3">© 2016-2020 batch
            <a href="https://mdbootstrap.com/education/bootstrap/"> Department of CSE</a>
          </div>
            
        </footer>
        <script>
//            Converting pdf
            function CovertPDF(el){
                var myNode = document.getElementById("searchcontent");
                while (myNode.firstChild) {
                    myNode.removeChild(myNode.firstChild);
                }
                var myButton = document.getElementById("final");
                while(myButton.firstChild){
                    myButton.removeChild(myButton.firstChild);
                }
                var restorepage = document.body.innerHTML;
                var printcontent = document.getElementById(el).innerHTML;
                document.body.innerHTML = printcontent;
                window.print();
                document.body.innerHTML = restorepage;
            }
            document.querySelector('.report-button').style.display = "none";
            document.querySelector('.sign-content').style.display = "none";
            function getData() {
                var from = document.querySelector(".from").value;
                console.log(from);
                var request = new XMLHttpRequest();
                request.onreadystatechange = function () {
                if((request.readyState === 4)&&(request.status === 200)){                           
                        responseText = request.responseText;
                        console.log(responseText);
                        display (responseText);
                    }
                }
                request.open("POST", "./FeedBackReport?message="+from,true);
                request.send();
            }
            function display(responseText){
            var chatResult = "";
            responseText = responseText.substr(0,responseText.length-1);
           
            if(responseText == ""){
                chatResult = "<h3 style='color:red;transition:0.4s;'> No Data Found </h3>";
                document.querySelector('.report-button').style.display = "none";
                document.querySelector('.sign-content').style.display = "none";
            }
            else{
                console.log(responseText);
            var displayMessage = responseText.split("|");
            console.log(displayMessage.length);
            for(var i=0;i<displayMessage.length;i=i+4){
                    
                  chatResult += "<li style='font-size:20px;'>" +"<b>" +displayMessage[i]+ " </b> :"+displayMessage[i+1]+"<br><small>"+displayMessage[i+2]+" "+displayMessage[i+3]+"</small></li>";
                  dispalay_button();
                   
            }
                function dispalay_button(){
                    document.querySelector(".report-button").style.display = 'block';
                    document.querySelector('.sign-content').style.display = "block";
                }
            
            }
            document.querySelector('.ul_list').innerHTML = chatResult;

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
