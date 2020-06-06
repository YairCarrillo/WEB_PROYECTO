/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.entidades;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author jonathan
 */
@Entity
@Table(name = "historial")
public class Historial implements Serializable{
    @Id
    private int idhistorial;
    private int cedula;
    private String curp;
    @Temporal(TemporalType.DATE)
    private Date fechaIngreso;
    @Temporal(TemporalType.DATE)
    private Date fechaAlta;
    private int idcausaHosp;
    private int noCama;
    private int noCuarto;

    public Historial() {
    }

    public int getIdhistorial() {
        return idhistorial;
    }

    public void setIdhistorial(int idhistorial) {
        this.idhistorial = idhistorial;
    }

    public int getCedula() {
        return cedula;
    }

    public void setCedula(int cedula) {
        this.cedula = cedula;
    }

    public String getCurp() {
        return curp;
    }

    public void setCurp(String curp) {
        this.curp = curp;
    }

    public Date getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(Date fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    public Date getFechaAlta() {
        return fechaAlta;
    }

    public void setFechaAlta(Date fechaAlta) {
        this.fechaAlta = fechaAlta;
    }

    public int getIdcausaHosp() {
        return idcausaHosp;
    }

    public void setIdcausaHosp(int idcausaHosp) {
        this.idcausaHosp = idcausaHosp;
    }

    public int getNoCama() {
        return noCama;
    }

    public void setNoCama(int noCama) {
        this.noCama = noCama;
    }

    public int getNoCuarto() {
        return noCuarto;
    }

    public void setNoCuarto(int noCuarto) {
        this.noCuarto = noCuarto;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Historial{idhistorial=").append(idhistorial);
        sb.append(", cedula=").append(cedula);
        sb.append(", curp=").append(curp);
        sb.append(", fechaIngreso=").append(fechaIngreso);
        sb.append(", fechaAlta=").append(fechaAlta);
        sb.append(", idcausaHosp=").append(idcausaHosp);
        sb.append(", noCama=").append(noCama);
        sb.append(", noCuarto=").append(noCuarto);
        sb.append('}');
        return sb.toString();
    }
}
