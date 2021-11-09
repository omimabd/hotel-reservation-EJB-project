<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="sessionbeans.VilleFacadeLocal"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="w3-container" style="opacity: 0.8;">

<%!
VilleFacadeLocal villeFacadeLocal;
%>
<%
Context context = null;
try {
  context = new InitialContext();
  villeFacadeLocal = (VilleFacadeLocal) context.lookup("java:global/EARProject/ProjetEJB/VilleFacade");
}
catch(Exception e) {
  e.printStackTrace();
}
%>
 <table class="w3-table w3-card-4 w3-sand w3-small w3-bordered  w3-border test" >
    <thead >
      <tr class="w3-ambe">
        <th>id</th>
        <th>Date debut</th>
        <th>Date fin</th>
        <th>Nombre de place</th>
        <th>Prix</th>
        <th>description</th>
        <th>ville de depart</th>
        <th>Action</th>
      </tr>
    </thead>
    <c:forEach items="${sessionScope.tours}" var="tour">
	    <tr>
	      <td>${tour.getId() }</td>
	      <td>${tour.getDate_debut() }</td>
	      <td>${tour.getDate_fin() }</td>
	      <td>${tour.getNbrPlaces() }</td>
	      <td>${tour.getPrix() }</td>
	      <td>${tour.getDescription() }</td>
	      <td>${tour.getVille_depart() }</td>
	      <td width="150px">
	      <div class="w3-show-inline-block">
	      <div class="w3-bar">
	      
	       <form action="deletetour.php" method="post">
	       <input name="tour_id" type="hidden" value="${tour.getId() }"> 
	       <button type="submit" class="btn btn-xs btn-danger mr-2 w3-tiny"><i class="fas fa-trash"></i></button>
	       </form>
	       	       </div>
	       	  <div class="d-inline">
	       
	      <form action="updatetour.php" method="post">
	       <input name="tour_id" type="hidden" value="${tour.getId() }"> 
	       <button type="submit" class="btn btn-xs btn-info mr-2 w3-tiny"> <i class="fas fa-edit"></i></button>
	       </form> 
	       </div>
	       </div>
	       </td>
	    </tr>
</c:forEach>
  </table>
  </div>