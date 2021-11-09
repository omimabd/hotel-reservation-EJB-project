package servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Reservation;
import sessionbeans.ReservationFacadeLocal;

@SuppressWarnings("serial")
@WebServlet(name = "reservation")
public class FinalReservation extends HttpServlet {

    @EJB
    private ReservationFacadeLocal reservationFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idRoom = Integer.parseInt(request.getParameter("roomId"));
        String checkInDate = request.getParameter("checkInDate");
        String checkOutDate = request.getParameter("checkOutDate");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String specialRequest = request.getParameter("specialRequest");
        Reservation res=new Reservation();
        res.setIdRoom(idRoom);
        res.setEmail(email);
        res.setFullName(fullName);
        res.setPhone(phone);
        res.setSpecialRequest(specialRequest);
        try {
			res.setCheckInDate(new SimpleDateFormat("yyyy-mm-dd").parse(checkInDate));
			res.setCheckOutDate(new SimpleDateFormat("yyyy-mm-dd").parse(checkOutDate));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        reservationFacade.create(res);
        
        RequestDispatcher reqDispatcher = getServletConfig().getServletContext().getRequestDispatcher("/views/home.jsp");
        reqDispatcher.forward(request, response);
    }
}
