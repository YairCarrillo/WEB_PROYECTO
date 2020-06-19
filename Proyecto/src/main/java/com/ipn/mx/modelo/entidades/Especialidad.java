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
    private String idesp;
    private String descesp;

    public Especialidad() {
    }

    public String getIdesp() {
        return idesp;
    }

    public void setIdesp(String idssp) {
        this.idesp = idssp;
    }

    public String getDescesp() {
        return descesp;
    }

    public void setDescesp(String descesp) {
        this.descesp = descesp;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Especialidad{idesp=").append(idesp);
        sb.append(", descesp=").append(descesp);
        sb.append('}');
        return sb.toString();
    }

    

    
   
    
    
}
