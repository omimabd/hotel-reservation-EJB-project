package sessionbeans;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import models.Tour;


@Stateless
public class TourFacade extends AbstractFacade<Tour> implements TourFacadeLocal {

    @PersistenceContext(unitName = "HotelReservation-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
    public TourFacade() {
        super(Tour.class);
    }

}
