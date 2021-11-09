<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hotel Reservation Systeme</title>
    <link rel="stylesheet" href="css/bootstrapmin.css">
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/4/w3.css">
     <link rel="stylesheet" href="css/sweetalert2.min.css">
    
    <script src="js/sweetalert2.all.min.js"></script>
    <script src="js/bootstrapmin.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">OUM<span style="color: #28a745">ACH H</span>otel </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="<%= request.getContextPath()%>">Home <span class="sr-only">(current)</span></a>
                </li>
               <c:if test="${sessionScope.username !=null }"> 
                <li class="nav-item">
                    <a class="nav-link" href="rooms.php">Rooms</a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link" href="reservations.php">Reservation</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="addroom.php">Ajouter Chambre</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="newtour.php">Ajouter Tour</a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="tours.php">Tours</a>
                </li>
                </c:if>
                
            </ul>
            <c:if test="${sessionScope.username ==null }">
                    <a class="btn btn-check btn-outline-success my-2 my-sm-0" onclick="document.getElementById('id01').style.display='block'">Login</a>
                </c:if>
            <c:if test="${sessionScope.username !=null }"> 
            <form class="form-inline my-2 my-lg-0" action="logout.php" method="get">
                <button  class="btn btn-check btn-outline-success my-2 my-sm-0" type="submit">Logout</button>
            </form>
             </c:if>       
             </div>
                   <div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

      <div class="w3-center"><br>
        <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
        <img src="img_avatar4.png" alt="Login Page" style="width:30%" class="w3-circle w3-margin-top">
      </div>

      <form class="w3-container" action="login.php" method="post">
        <div class="w3-section">
          <label><b>Username</b></label>
          <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Enter Username" name="username" required>
          <label><b>Password</b></label>
          <input class="w3-input w3-border" type="password" placeholder="Enter Password" name="password" required>
          <input type="submit" class="w3-button w3-block w3-green w3-section w3-padding" value="login" name="button">
       
        </div>
      </form>

      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id01').style.display='none'" type="button" class="w3-button w3-red">Cancel</button>
      </div>

    </div>
  </div>
    </nav>