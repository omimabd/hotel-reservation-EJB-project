<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<%@ include file="header.jsp" %>

    <%
        String roomId = request.getAttribute("roomId").toString();
        String checkInDate = request.getAttribute("checkInDate").toString();
        String checkOutDate = request.getAttribute("checkOutDate").toString();
        Double price = Double.parseDouble(request.getAttribute("price").toString());
        
        // calculate number of day
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date d1 = sdf.parse(checkInDate);
        Date d2 = sdf.parse(checkOutDate);
        int numberOfDays = (int)( (d2.getTime() - d1.getTime()) / (1000 * 60 * 60 * 24));
        
        double totalPrice = numberOfDays * price;        
    %>
    <div class="bg-img">
    <div class="card-header lead" style="opacity: 0.8;">
        <h1>Final Reservation</h1>
        <p>Veuillez remplir le formulaire pour terminer le processus de réservation.</p>
    </div>

    <div class="card-body w3-light-grey" style="opacity: 0.9;">
        <div class="alert alert-info">
            <strong>la chambre N°: </strong>${roomId}
        </div>
        <div class="alert alert-info">
            <Strong>De: </Strong><span id='checkInDate'>${checkInDate}</span><br>
            <Strong>À: </Strong><span id='checkOutDate'>${checkOutDate}</span><br>
            <Strong>Nombre de jours: </Strong><span id='dayNumbers'>10</span><br>
            <strong>Prix ​​pour une nuit: </strong><span id='price'>${price} DZD</span><br>
            <strong>Prix ​​total: </strong> <span id='totalPrice'>${totalPrice}25000.0 DZD</span>
        </div>
        <form action="FinalReservation" method="POST">
            <input type="hidden" name="roomId" value="${roomId}">
            <input type="hidden" name="checkInDate" value="${checkInDate}">
            <input type="hidden" name="checkOutDate" value="${checkOutDate}">
            <div class="form-group">
                <label for="fullName">Nom et prénom</label>
                <input type="text" class="form-control" name="fullName" id="fullName" placeholder="Type full name">
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" name="email" id="email" aria-describedby="emailHelp" placeholder="Type your email">
                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
            </div>
            <div class="form-group">
                <label for="phone">Telephone</label>
                <input type="phone" class="form-control" name="phone" id="phone" placeholder="Type phone number">
            </div>
            <div class="form-group">
                <label for="specialRequest">Demande spéciale</label>
                <textarea class="form-control" name="specialRequest" id="specialRequest" rows="3"></textarea>
            </div>
            <div>
                <button type="submit" class="btn btn-success">Submit</button>
            </div>
        </form>
                        <a href="<%= request.getContextPath() %>"><button class="btn btn-secondary" style="display: block; float: right; margin-bottom: 15px">retour à la page d'accueil</button></a>
        
    </div>
 </div>           
    <script>
        // calculate total days
        var checkInDate = "${checkInDate}",
            checkOutDate = "${checkOutDate}",
            result = document.getElementById("dayNumbers");

        var checkInDateArray = checkInDate.split("-"),
        checkInDateDays = Number.parseInt(checkInDateArray[0]) * 365 + Number.parseInt(checkInDateArray[1]) * 31 + Number.parseInt(checkInDateArray[2]),
        dateOutDate = checkOutDate.split("-"),
        checkOutDateDays = Number.parseInt(checkOutDateArray[0]) * 365 + Number.parseInt(checkOutDateArray[1]) * 31 + Number.parseInt(checkOutDateArray[2]),
        diffDays = checkOutDateDays - checkInDateDays;

        result.innerText = diffDays;
        
        // calculate total price
        var price = ${price},
            totalPrice = document.getElementById("totalPrice");
        price = parseFloat(price);
        
        totalPrice.innerText = price * diffDays;
    </script>
	<%@ include file="footer.jsp" %>

