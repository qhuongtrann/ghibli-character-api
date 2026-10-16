package com.tran.ghibli_api.characters;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;

@Entity
@Table(name = "characters")
public class GhibliCharacter {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long characterId;

    @NotBlank
    private String name;

    @NotBlank
    private String description;
    private String universe;
    private String species;
    private String role;

    public GhibliCharacter() 
    {

    }

    public Long getCharacterId() 
    {
        return characterId;
    }

    public String getName() 
    {
        return name;
    }

    public void setName(String name) 
    {
        this.name = name;
    }

    public String getDescription() 
    {
        return description;
    }

    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getUniverse() 
    {
        return universe;
    }

    public void setUniverse(String universe) 
    {
        this.universe = universe;
    }

    public String getSpecies() 
    {
        return species;
    }

    public void setSpecies(String species) 
    {
        this.species = species;
    }

    public String getRole() 
    {
        return role;
    }

    public void setRole(String role) 
    {
        this.role = role;
    }
}
