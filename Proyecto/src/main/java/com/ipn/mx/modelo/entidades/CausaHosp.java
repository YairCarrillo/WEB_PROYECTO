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
 * @author jonathan
 */
@Entity
@Table(name = "causahosp")
public class CausaHosp implements Serializable{
    @Id
    private int idCausaHosp;
    private String tratamiento;
    private String observaciones;

    public CausaHosp() {
    }

    public int getIdCausaHosp() {
        return idCausaHosp;
    }

    public void setIdCausaHosp(int idCausaHosp) {
        this.idCausaHosp = idCausaHosp;
    }

    public String getTratamiento() {
        return tratamiento;
    }

    public void setTratamiento(String tratamiento) {
        this.tratamiento = tratamiento;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("CausaHosp{idCausaHosp=").append(idCausaHosp);
        sb.append(", tratamiento=").append(tratamiento);
        sb.append(", observaciones=").append(observaciones);
        sb.append('}');
        return sb.toString();
    }
}
