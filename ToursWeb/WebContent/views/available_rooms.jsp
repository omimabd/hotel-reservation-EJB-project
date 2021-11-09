<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="models.Room"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
	<%@ include file="header.jsp" %>

        <%
            String checkInDate = request.getAttribute("checkInDate").toString();
            String checkOutDate = request.getAttribute("checkOutDate").toString();
            List<Room> availableRooms = (List<Room>) request.getAttribute("availableRooms");
        %>
	<div class="bg-img">
        <div class="card-header w3-gray" style="opacity: 0.8;">
            <h1>Chambres  Disponible</h1>
            <p>from <span>${checkInDate}</span> to <span>${checkOutDate}</span></p>
        </div>

        <div  style="margin-bottom: 50px; opacity: 0.7;">
            <%
                if(availableRooms.size() < 1) {
                    out.println("<div class='card-body  w3-panel w3-yellow' style='margin-bottom: 20px'> <br><strong>Aucun Chambre disponible se moment!</strong><br></div>");
                }
            %>
            

            <c:forEach items="${availableRooms}" var="room">
                <div class="card w-100" style="margin-bottom: 20px">
                    <div class="card-header">Room #${room.id}</div>
                    <div class="card-body">
                        <h5 class="card-title">Room for ${room.numberOfPerson} adult</h5>
                        <p class="card-text">${room.description}</p>
                        <p class="card-text">Price: ${room.price} DZD</p>
                        <form action="AvailableRooms" method="GET">
                            <input type="hidden" name="roomId" value="${room.id}" />
                            <input type="hidden" name="price" value="${room.price}" />
                            <input type="hidden" name="checkInDate" value="${checkInDate}" />
                            <input type="hidden" name="checkOutDate" value="${checkOutDate}" />
                            <input type="submit" class="btn btn-success" value="I'll Reserve">
                        </form>
                    </div>
                </div>
            </c:forEach>
                        <a href="<%= request.getContextPath()%>"><button class="btn btn-secondary" style="display: block; float: right; margin-bottom: 10px">Back to Home</button></a>
        </div>
        </div>
	<%@ include file="footer.jsp" %>

