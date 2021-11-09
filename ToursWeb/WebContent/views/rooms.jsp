<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="w3-container" style="opacity: 0.8;">
 <table class="w3-table w3-card-4 w3-sand w3-small w3-bordered  w3-border test" >
    <thead >
      <tr class="w3-ambe">
        <th>id</th>
        <th>Prix</th>
        <th>Nombre de personne</th>
        <th>Integration de douche</th>
        <th>Description</th>
        <th>Action</th>
      </tr>
    </thead>
    <c:forEach items="${sessionScope.rooms}" var="room">
	    <tr>
	      <td>${room.getId() }</td>
	      <td>${room.getPrice() }</td>
	      <td>${room.getNumberOfPerson() }</td>
	      <td>${room.getHavePrivateBathroom() }</td>
	      <td>${room.getDescription() }</td>
	      <td width="150px">
	      <div class="w3-show-inline-block">
	      <div class="w3-bar">
	      
	       <form action="deleteroom.php" method="post">
	       <input name="room_id" type="hidden" value="${room.getId() }"> 
	       <button type="submit" class="btn btn-xs btn-danger mr-2 w3-tiny"><i class="fas fa-trash"></i></button>
	       </form>
	       	       </div>
	       	  <div class="d-inline">
	       
	      <form action="updateroom.php" method="post">
	       <input name="room_id" type="hidden" value="${room.getId() }"> 
	       <button type="submit" class="btn btn-xs btn-info mr-2 w3-tiny"> <i class="fas fa-edit"></i></button>
	       </form> 
	       </div>
	       </div>
	       </td>
	    </tr>
</c:forEach>
  </table>
  </div>