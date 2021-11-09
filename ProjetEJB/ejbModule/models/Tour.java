package models;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

/**
 * Entity implementation class for Entity: Tour
 *
 */
@Entity

public class Tour implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
	private int id;
	private int nbrPlaces;   
	private Date date_debut;
	private Date date_fin;
	private double prix;
	private int ville_depart;
	private String description;	
	public Tour() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getNbrPlaces() {
		return nbrPlaces;
	}
	public void setNbrPlaces(int nbrPlaces) {
		this.nbrPlaces = nbrPlaces;
	}
	public Date getDate_debut() {
		return date_debut;
	}
	public void setDate_debut(Date date_debut) {
		this.date_debut = date_debut;
	}
	public Date getDate_fin() {
		return date_fin;
	}
	public void setDate_fin(Date date_fin) {
		this.date_fin = date_fin;
	}
	public double getPrix() {
		return prix;
	}
	public void setPrix(double prix) {
		this.prix = prix;
	}
	public int getVille_depart() {
		return ville_depart;
	}
	public void setVille_depart(int ville_depart) {
		this.ville_depart = ville_depart;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
}
