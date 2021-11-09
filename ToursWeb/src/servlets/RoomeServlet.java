package servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Reservation;
import models.Room;
import models.Tour;
import sessionbeans.ReservationFacadeLocal;
import sessionbeans.RoomFacadeLocal;
import sessionbeans.TourFacadeLocal;
import sessionbeans.VilleFacadeLocal;

/**
 * Servlet implementation class RoomeServlet
 */
@WebServlet(name="/RoomeServlet", urlPatterns = "*.php")
public class RoomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	@EJB
	private RoomFacadeLocal roomfacadelocal;
	@EJB
	private ReservationFacadeLocal reservationfacadelocal;
	@EJB
	private TourFacadeLocal tourFacadeLocal;
	@EJB 
	private VilleFacadeLocal villeFacadeLocal;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		String url = request.getServletPath();
		if (url.equals("/addroom.php")) {
			System.out.println("achraf");
			url="/addroom.php";
			session.setAttribute("url", url);
			  request.getServletContext().getRequestDispatcher("/views/layouts.jsp").forward( request, response);
		}
		
		if(url.equals("/reservations.php")) {
			List<Reservation> reservations= reservationfacadelocal.findAll();
			session.setAttribute("reservations", reservations);
			url="/reservations.php";
			session.setAttribute("url", url);
			 request.getServletContext().getRequestDispatcher("/views/layouts.jsp").forward( request, response);
		}
		
		if (url.equals("/rooms.php")) {
			List<Room> rooms=roomfacadelocal.findAll();
			session.setAttribute("url", "/rooms.php");
			session.setAttribute("rooms", rooms);
			request.getServletContext().getRequestDispatcher("/views/layouts.jsp").forward( request, response);
		}
		
		  if(url.equals("/logout.php")) {
	        	   session.invalidate();
	   			request.getServletContext().getRequestDispatcher("/views/home.jsp").forward( request, response);

	        	 }
		  if (url.equals("/newtour.php")) {
			
			url="/newtour.php";
			session.setAttribute("url", url);
			session.setAttribute("ville", villeFacadeLocal.findAll());
			request.getServletContext().getRequestDispatcher("/views/layouts.jsp").forward( request, response);

		}
		  if(url.equals("/tours.php")) {
			  session.setAttribute("url", "/tours.php");
			  session.setAttribute("tours", tourFacadeLocal.findAll());
			  request.getServletContext().getRequestDispatcher("/views/layouts.jsp").forward( request, response);

		  }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		String url = request.getServletPath();
		
		if(url.equals("/addtour.php")) {
  			int ville_depart=Integer.parseInt(request.getParameter("ville_depart"));
  			String dateD=request.getParameter("dateD");
  			String dateF=request.getParameter("dateF");
  			Double prix=Double.parseDouble(request.getParameter("prix"));
  			int nbrP=Integer.parseInt(request.getParameter("nbrP"));
  			String description=request.getParameter("description");
  			Tour tour=new Tour();
  			tour.setVille_depart(ville_depart);
  			tour.setNbrPlaces(nbrP);
  			tour.setDescription(description);
  			tour.setPrix(prix);
  	        try {
  				tour.setDate_debut(new SimpleDateFormat("yyyy-mm-dd").parse(dateD));
  				tour.setDate_fin(new SimpleDateFormat("yyyy-mm-dd").parse(dateF));
  			} catch (ParseException e1) {
  				// TODO Auto-generated catch block
  				e1.printStackTrace();
  			}
  	        tourFacadeLocal.create(tour);
  		  request.getServletContext().getRequestDispatcher("/views/home.jsp").forward(request, response);

  	        
		}
    	  if(url.equals("/login.php")) {
	    		  	if(session.getAttribute("username")!=null) {
	        		request.getServletContext().getRequestDispatcher("/views/home.jsp").forward(request, response);
	    		  }
    	        String username = request.getParameter("username");
    		    String password = request.getParameter("password");
    	       

    		     if(username.equals("admin") && password.equals("admin"))
    		  {	 
    		    session.setAttribute("username", username);
    		  
    		  	url="/admin.php";
    		  	session.setAttribute("url", url);
    		  request.getServletContext().getRequestDispatcher("/views/home.jsp").forward(request, response);
    		  }
    		 

    		  else
    		    	 
    		  {    
        		  System.out.println("erreur");
        	 
        	 
        		  request.getServletContext().getRequestDispatcher("/views/erreur.jsp").forward(request, response);
        		 
    		  }}
    	  
    	  
    	  
		if (url.equals("/saveRoom.php")) {
			Double prix=Double.parseDouble(request.getParameter("prix"));
			int nbr_person=Integer.parseInt(request.getParameter("nbr_person"));
			String description=request.getParameter("description");
			boolean have_private_bathroom = false;
			if (request.getParameter("have_private_bathroom").equals("oui")) {
				have_private_bathroom=true;
			}
			
			Room room=new Room();
			room.setDescription(description);
			room.setHavePrivateBathroom(have_private_bathroom);
			room.setNumberOfPerson(nbr_person);
			room.setPrice(prix);
			roomfacadelocal.create(room);
			
			url="/addroom.php";
			session.setAttribute("url", url);
			  request.getServletContext().getRequestDispatcher("/views/layouts.jsp").forward( request, response);
		}
		
		if(url.equals("/deletereservation.php")) {
			int id=Integer.parseInt(request.getParameter("reservation_id"));
			reservationfacadelocal.remove(reservationfacadelocal.find(id));
			response.sendRedirect("reservations.php");

		}
		
		if (url.equals("/deleteroom.php")) {
			int id=Integer.parseInt(request.getParameter("room_id"));
			roomfacadelocal.remove(roomfacadelocal.find(id));
			response.sendRedirect("rooms.php");
		
		}
		
		if (url.equals("/updateroom.php")) {
			int id=Integer.parseInt(request.getParameter("room_id"));
			Room room=roomfacadelocal.find(id);
			session.setAttribute("room", room);
			session.setAttribute("url", "/updateroom.php");
			 request.getServletContext().getRequestDispatcher("/views/layouts.jsp").forward( request, response);		
			 }
		
		if (url.equals("/UpRoom.php")) {
			Double prix=Double.parseDouble(request.getParameter("prix"));
			int nbr_person=Integer.parseInt(request.getParameter("nbr_person"));
			String description=request.getParameter("description");
			boolean have_private_bathroom = false;
			if (request.getParameter("have_private_bathroom").equals("oui")) {
				have_private_bathroom=true;
			}
			int id=Integer.parseInt(request.getParameter("room_id"));
			
			Room room=roomfacadelocal.find(id);
			room.setDescription(description);
			room.setHavePrivateBathroom(have_private_bathroom);
			room.setNumberOfPerson(nbr_person);
			room.setPrice(prix);
			roomfacadelocal.edit(room);
			response.sendRedirect("rooms.php");

		}
		
		if (url.equals("/deletetour.php")) {
			int id=Integer.parseInt(request.getParameter("tour_id"));
			tourFacadeLocal.remove(tourFacadeLocal.find(id));
			response.sendRedirect("tours.php");
		
		}
		
		if (url.equals("/updatetour.php")) {
			int id=Integer.parseInt(request.getParameter("tour_id"));
			Tour tour=tourFacadeLocal.find(id);
			session.setAttribute("tour", tour);
			session.setAttribute("ville", villeFacadeLocal.findAll());
			session.setAttribute("url", "/updatetour.php");
			 request.getServletContext().getRequestDispatcher("/views/layouts.jsp").forward( request, response);		
			 }
		
		if (url.equals("/UpTour.php")) {
			int ville_depart=Integer.parseInt(request.getParameter("ville_depart"));
  			String dateD=request.getParameter("dateD");
  			String dateF=request.getParameter("dateF");
  			Double prix=Double.parseDouble(request.getParameter("prix"));
  			int nbrP=Integer.parseInt(request.getParameter("nbrP"));
  			String description=request.getParameter("description");
  			int tour_id=Integer.parseInt(request.getParameter("tour_id"));
  			Tour tour=tourFacadeLocal.find(tour_id);
  			tour.setVille_depart(ville_depart);
  			tour.setNbrPlaces(nbrP);
  			tour.setDescription(description);
  			tour.setPrix(prix);
  	        try {
  				tour.setDate_debut(new SimpleDateFormat("yyyy-mm-dd").parse(dateD));
  				tour.setDate_fin(new SimpleDateFormat("yyyy-mm-dd").parse(dateF));
  			} catch (ParseException e1) {
  				// TODO Auto-generated catch block
  				e1.printStackTrace();
  			}
  	        tourFacadeLocal.edit(tour);
			response.sendRedirect("tours.php");

		}
	}

}
