<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form action="UpRoom.php" method="POST" class="w3-container w3-card-4 w3-light-grey" style="opacity: 0.8;">
  <h2>Modifier une Chambre</h2>
  <p>
  <input name="room_id" type="hidden" value="${sessionScope.room.getId() }">
  <label>Prix :</label>
  <input value="${sessionScope.room.getPrice() }" class="w3-input w3-border w3-round-large" name="prix" type="number" required="required"></p>
  <p>
    <label>Nombres de Personne :</label>
  <input value="${sessionScope.room.getNumberOfPerson() }" class="w3-input w3-border w3-round-large" name="nbr_person" type="number" required="required"></p>
  <p>
    <label>L'existance de douche prive :</label>
    <input class="w3-radio" type="radio" name="have_private_bathroom" value="oui" <c:if test="${sessionScope.room.getHavePrivateBathroom() }">checked="checked"</c:if> >
	<label>Oui</label>
	<input class="w3-radio" type="radio" name="have_private_bathroom" value="no" <c:if test="${sessionScope.room.getHavePrivateBathroom()==false }">checked="checked"</c:if>>
	<label>No</label>
  <p>
    <p>
  <label>Description :</label>
    <textarea class="w3-input w3-border w3-round-large" name="description"  cols="30" rows="7">${sessionScope.room.getDescription() }</textarea>
  <p>
   <button type="submit" class="w3-button w3-block w3-teal w3-round-large">Modifier</button>
  <br>
</form>