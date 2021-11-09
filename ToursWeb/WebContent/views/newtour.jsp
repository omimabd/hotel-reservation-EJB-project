<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
	<form action="addtour.php" method="POST" class="w3-container w3-card-4 w3-light-grey" style="opacity: 0.8;">
		  <h2>Ajouter une Tour</h2>
		  <p>
		  	 <label>ville</label>
			 <select class="w3-select" name="ville_depart" >
		          <c:forEach items="${sessionScope.ville }" var="v">
		         <option value="${ v.getId_ville() }">${ v.getNom_ville() }</option></c:forEach>
			   </select> </p>
		  <p>
		  <label>Prix :</label>
		  <input class="w3-input w3-border w3-round-large" name="prix" type="number" required="required"></p>
		  <p>
		    <label>Date debut :</label>
		  <input class="w3-input w3-border w3-round-large" name="dateD" type="date" required="required"></p>
		  <p>
		    <label>Date fin :</label>
		    <input class="w3-input w3-border w3-round-large" type="date" name="dateF" required>
		    </p>
		    <p>
			<label>Nombre de place</label>
			<input class="w3-input w3-border w3-round-large" type="number" name="nbrP" required>
			</p>
		    <p>
		  <label>Description :</label>
		    <textarea class="w3-input w3-border w3-round-large" name="description"  cols="30" rows="7"></textarea>
		  <p>
		   <button type="submit" class="w3-button w3-block w3-teal w3-round-large">Ajouter</button>
		  <br>
</form>