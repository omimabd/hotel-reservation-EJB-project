package sessionbeans;

import java.util.List;

import javax.ejb.Local;

import models.Tour;

@Local
public interface TourFacadeLocal {
    void create(Tour tour);

    void edit(Tour tour);

    void remove(Tour tour);

    Tour find(Object id);

    List<Tour> findAll();
}
