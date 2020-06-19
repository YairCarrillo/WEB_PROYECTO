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
@Table(name = "cuarto")
public class Cuarto implements Serializable{
    @Id
    private int noCuarto;
    private int idedoCuarto;

    public Cuarto() {
    }

    public int getNoCuarto() {
        return noCuarto;
    }

    public void setNoCuarto(int noCuarto) {
        this.noCuarto = noCuarto;
    }

    public int getIdedoCuarto() {
        return idedoCuarto;
    }

    public void setIdedoCuarto(int idedoCuarto) {
        this.idedoCuarto = idedoCuarto;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Cuarto{noCuarto=").append(noCuarto);
        sb.append(", idedoCuarto=").append(idedoCuarto);
        sb.append('}');
        return sb.toString();
    }
}
