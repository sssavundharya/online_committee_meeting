<%-- 
    Document   : newjsp
    Created on : Mar 20, 2019, 11:58:48 PM
    Author     : Sathish
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Chat theme example</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
        <!-- Bootstrap core CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.7.4/css/mdb.min.css" rel="stylesheet">
        <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
        <link rel="shortcut icon" href="img/sourceImg/ksricon.png" type="image/x-icon">
        <script>
            function startTime() {
              var today = new Date();
              var h = today.getHours();
              var m = today.getMinutes();
              var s = today.getSeconds();
              m = checkTime(m);
              s = checkTime(s);
              document.getElementById('txt').innerHTML =
              h + ":" + m + ":" + s;
              var t = setTimeout(startTime, 500);
            }
            function checkTime(i) {
              if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
              return i;
            }
        </script>
        <style>
            * {
                margin: 0;
                padding: 0;
                font-family: tahoma, sans-serif;
                box-sizing: border-box;
            }
            .chatbox {
                padding: 25px;
                margin:14.5px auto;
            }

            .chatlogs {
                padding: 10px;
                width: 100%;
                height: 450px;
                overflow-x: hidden;
                overflow-y: scroll;
            }

            .chatlogs::-webkit-scrollbar {
                width: 10px;
            }

            .chatlogs::-webkit-scrollbar-thumb {
                border-radius: 5px;
                background: rgba(0,0,0,.1);
            }

            .chat {
                display: flex;
                flex-flow: row wrap;
                align-items: flex-start;
                margin-bottom: 10px;
            }


            .chat .user-photo {
                width: 60px;
                height: 60px;
                background: #ccc;
                border-radius: 50%;
            }

            .chat .chat-message {
                width: 80%;
                padding: 15px;
                margin: 5px 10px 0;
                border-radius: 10px;
                color: #fff;
                font-size: 20px;
            }

            .friend .chat-message {
                background: #1adda4;
            }

            .self .chat-message {
                background: #1ddced;
                order: -1;
            }

            .chat-form {
                margin-top: 20px;
                display: flex;
                align-items: flex-start;
            }

            .chat-form textarea {
                background: #fbfbfb;
                width: 75%;
                height: 50px;
                border: 2px solid #eee;
                border-radius: 3px;
                resize: none;
                padding: 10px;
                font-size: 18px;
                color: #333;
            }

            .chat-form textarea:focus {
                background: #fff;
            }
            textarea{
                overflow-y: hidden;
            }

            

            .chat-form button:hover {
                background: #13c8d9;
            }
            
            nav div{
            margin-left: 600px;
            font-size: 25px;
            color: white;
            font-family: 'Open Sans', sans-serif;
        }
        footer{
            margin-top:0px;
        }
            i{
                margin-left: -220px;
            }
            h3{
                margin-top: 20px;
                font-size: 40px;
            }
            .color{
                color: red;
            }
        </style>
        
</head>
<body onload="startTime()">
    
    <nav class="navbar navbar-dark indigo animated zoomIn">
            <div class="college-name">
                K.S.R College of Engineering
            </div>
    </nav>
        <div class="container">
                <div class="welcome">
                    <div class="row">
                        <div class="col-md-4 col-sm-4 col-lg-4">
                            <h3 class="time" style="margin-left: 200px;"><i class="fa fa-clock"></i> <span id="txt"></span></h3>
                        </div>
                        <div class="col-md-4 col-sm-4 col-lg-4">
                            <h3 class="color-chnge"><span class="color">M</span>eeting Session</h3>
                        </div>
                        <div class="col-md-4 col-sm-4 col-lg-4">
                            <h3 class="date" style="margin-left: 300px;"><i class="fa fa-calendar"></i> <span class="inline"></span></h3>
                        </div>
                    </div>
                    
                </div>
        </div>
    <div class="container">
        <div class="chatbox">
            <div class="chatlogs">

            </div>
            
            <div class="chat-form">
                <textarea class="mt-1 texting"></textarea>
                <button  class="btn btn-danger" onclick="doPostChatMessage()">Send</button>
            </div>
        </div>
    </div>   
        <footer class="page-footer font-small blue animated zoomIn">
              <div class="footer-copyright text-center py-3">© 2016-2020 batch
                <a href="https://mdbootstrap.com/education/bootstrap/"> Department of CSE</a>
              </div>
            
        </footer>
    <%String username = (String) request.getSession(false).getAttribute("username"); %>
    <script>
        var today = new Date();
        var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
        document.querySelector('.inline').innerHTML = date;
    </script>
    <script>
        function updateScroll(){
            var element = document.querySelector('.chatlogs');
            element.scrollTop = element.scrollHeight;
        }
        setInterval(updateScroll,101);
        setInterval(getData,1000);
//        setInterval(function(){
//            var scroll = document.querySelector('.chatlogs');
//            window.scrollTo(0,scroll,scrollHeight);
//        },100);
        function doPostChatMessage() {
            var userMessage = document.querySelector('.texting').value;
//            console.log(userMessage);
            var request = new XMLHttpRequest();
            request.onreadystatechange = function () {
            if((request.readyState === 4)&&(request.status === 200)){                           
                userMessage = request.responseText;
//                console.log(userMessage);
                }
            }
            request.open("POST", "./ChatFormServlet?message="+userMessage,true);
            request.send();
            document.querySelector(".texting").value = "";
            setTimeout(getData,101);
           
        }
        
        function getData() {
            var request = new XMLHttpRequest();
            request.onreadystatechange = function () {
            if((request.readyState === 4)&&(request.status === 200)){                           
                    responseText = request.responseText;
//                    console.log(responseText);
                    display(responseText);
                }
            }
            request.open("GET", "./ChatFormServlet",true);
            request.send();
            
            
        }
        function display(responseText){
            var chatResult = "";
            responseText = responseText.substr(0,responseText.length-1);
            console.log(responseText);
            var displayMessage = responseText.split("|");
            console.log(displayMessage.length);
            for(var i=0;i<displayMessage.length;i=i+4){
                  if(displayMessage[i] === "<%= username %>"){
                      chatResult += "<div class='chat self'><div class='user-photo'></div><p class='chat-message'>"+
                              displayMessage[i+1]+"<br><small style='font-size:10px;'>"+displayMessage[i+2]+" "+displayMessage[i+3]+"</small>"+"</p></div>";
                   }
                   else{
                      chatResult += "<div class='chat friend'><div class='user-photo'></div><p class='chat-message'>"+
                              displayMessage[i]+":  "+displayMessage[i+1]+"<br><small style='font-size:10px;'>"+displayMessage[i+2]+" "+displayMessage[i+3]+"</small>"+"</p></div>";
                   }
            }
            document.querySelector('.chatlogs').innerHTML = chatResult;
        }
        
        
    </script>
   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.debug.js" integrity="sha384-NaWTHo/8YCBYJ59830LTz/P4aQZK1sS0SneOgAvhsIl3zBu8r9RevNg5lHCHAuQ/" crossorigin="anonymous"></script>

	<!-- Material form login -->
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
