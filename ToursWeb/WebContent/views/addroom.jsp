<form action="saveRoom.php" method="POST" class="w3-container w3-card-4 w3-light-grey" style="opacity: 0.8;">
  <h2>Ajouter une Chambre</h2>
  <p>
  <label>Prix :</label>
  <input class="w3-input w3-border w3-round-large" name="prix" type="number" required="required"></p>
  <p>
    <label>Nombres de Personne :</label>
  <input class="w3-input w3-border w3-round-large" name="nbr_person" type="number" required="required"></p>
  <p>
    <label>L'existance de douche prive :</label>
    <input class="w3-radio" type="radio" name="have_private_bathroom" value="oui">
	<label>Oui</label>
	<input class="w3-radio" type="radio" name="have_private_bathroom" value="no" checked="checked">
	<label>No</label>
  <p>
    <p>
  <label>Description :</label>
    <textarea class="w3-input w3-border w3-round-large" name="description"  cols="30" rows="7"></textarea>
  <p>
   <button type="submit" class="w3-button w3-block w3-teal w3-round-large">Ajouter</button>
  <br>
</form>