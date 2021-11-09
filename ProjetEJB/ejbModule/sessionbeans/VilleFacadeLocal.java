package sessionbeans;

import java.util.List;

import javax.ejb.Local;
import models.Ville;
@Local
public interface VilleFacadeLocal {
    void create(Ville ville);

    void edit(Ville ville);

    void remove(Ville ville);

    Ville find(Object id);

    List<Ville> findAll();
}
