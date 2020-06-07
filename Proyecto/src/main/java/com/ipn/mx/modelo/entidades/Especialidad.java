/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.entidades;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author yirz
 */
@Entity
@Table(name="especialidad")
public class Especialidad implements Serializable{
    @Id
    private int idEsp;
    private String descEsp;

    public Especialidad() {
    }

    public Especialidad(int idEsp, String descEsp) {
        this.idEsp = idEsp;
        this.descEsp = descEsp;
    }

    public int getIdEsp() {
        return idEsp;
    }

    public void setIdEsp(int idEsp) {
        this.idEsp = idEsp;
    }

    public String getDescEsp() {
        return descEsp;
    }

    public void setDescEsp(String descEsp) {
        this.descEsp = descEsp;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Especialidad{idEsp=").append(idEsp);
        sb.append(", descEsp=").append(descEsp);
        sb.append('}');
        return sb.toString();
    }
   
    
    
}
