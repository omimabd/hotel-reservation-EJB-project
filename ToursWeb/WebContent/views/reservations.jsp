<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="w3-container" style="opacity: 0.7;">
 <table class="w3-table w3-sand w3-small w3-bordered  w3-border test" >
    <thead >
      <tr class="w3-ambe">
        <th>id</th>
        <th>Date d'entrer</th>
        <th>Date de sortie</th>
        <th>Email</th>
        <th>Nom et Prenom</th>
        <th>Telephone</th>
        <th>Demandes Speciales</th>
        <th>Numero du chambre</th>
        <th>Action</th>
      </tr>
    </thead>
    <c:forEach items="${sessionScope.reservations}" var="reservation">
	    <tr>
	      <td>${reservation.getId() }</td>
	      <td>${reservation.getCheckInDate() }</td>
	      <td>${reservation.getCheckOutDate() }</td>
	      <td>${reservation.getEmail() }</td>
	      <td>${reservation.getFullName() }</td>
	      <td>${reservation.getPhone() }</td>
	      <td>${reservation.getSpecialRequest() }</td>
	      <td>${reservation.getIdRoom() }</td>
	      <td>
	       <form action="deletereservation.php" method="post">
	       <input name="reservation_id" type="hidden" value="${reservation.getId() }"> 
	       <button type="submit" class="btn btn-danger">Supprimer</button>
	       </form>
	       </td>
	    </tr>
</c:forEach>
  </table>
  </div>