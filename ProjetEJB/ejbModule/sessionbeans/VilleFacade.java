package sessionbeans;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import models.Ville;
@Stateless
public class VilleFacade extends AbstractFacade<Ville> implements VilleFacadeLocal {
    @PersistenceContext(unitName = "HotelReservation-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public VilleFacade() {
        super(Ville.class);
    }
}
