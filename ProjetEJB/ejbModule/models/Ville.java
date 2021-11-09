package models;

import java.io.Serializable;
import javax.persistence.*;

/**
 * Entity implementation class for Entity: Ville
 *
 */
@Entity

public class Ville{

	   
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
	private int id_ville;
	private String nom_ville;
	
	public Ville() {
		super();
	}   
	public int getId_ville() {
		return this.id_ville;
	}

	public void setId_ville(int id_ville) {
		this.id_ville = id_ville;
	}   
	public String getNom_ville() {
		return this.nom_ville;
	}

	public void setNom_ville(String nom_ville) {
		this.nom_ville = nom_ville;
	}
   
}
