<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
	<form action="UpTour.php" method="POST" class="w3-container w3-card-4 w3-light-grey" style="opacity: 0.8;">
		  <h2>Ajouter une Tour</h2>
		  <p>
		  	 <label>ville</label>
			 <select class="w3-select" name="ville_depart" >
		          <c:forEach items="${sessionScope.ville }" var="v">
		         <option value="${ v.getId_ville() }" <c:if test="${sessionScope.tour.getVille_depart()==v.getId_ville() }">selected</c:if>  >${ v.getNom_ville() }</option></c:forEach>
			   </select> </p>
		  <p>
		  <label>Prix :</label>
		  <input value="${sessionScope.tour.getPrix() }" class="w3-input w3-border w3-round-large" name="prix" type="number" required="required"></p>
		  <p>
		    <label>Date debut :</label>
		  <input  class="w3-input w3-border w3-round-large" name="dateD" type="datetime" value="${sessionScope.tour.getDate_debut() }" required="required"></p>
		  <p>
		    <label>Date fin :</label>
		    <input value="${sessionScope.tour.getDate_fin() }" class="w3-input w3-border w3-round-large" type="datetime" name="dateF" required>
		    </p>
		    <p>
			<label>Nombre de place</label>
			<input value="${sessionScope.tour.getNbrPlaces() }" class="w3-input w3-border w3-round-large" type="number" name="nbrP" required>
			</p>
		    <p>
		  <label>Description :</label>
		    <textarea  class="w3-input w3-border w3-round-large" name="description"  cols="30" rows="7"> ${sessionScope.tour.getDescription() }</textarea>
		  <p>
		    <input name="tour_id" type="hidden" value="${sessionScope.tour.getId() }">
		  
		   <button type="submit" class="w3-button w3-block w3-teal w3-round-large">Modifier</button>
		  <br>
</form>