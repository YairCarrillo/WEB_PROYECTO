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
@Table(name = "edocuarto")
public class EdoCuarto implements Serializable{
    @Id
    private String idedoCuarto;
    private String edoCuarto;

    public EdoCuarto() {
    }

    public String getIdedoCuarto() {
        return idedoCuarto;
    }

    public void setIdedoCuarto(String idedoCuarto) {
        this.idedoCuarto = idedoCuarto;
    }

    public String getEdoCuarto() {
        return edoCuarto;
    }

    public void setEdoCuarto(String edoCuarto) {
        this.edoCuarto = edoCuarto;
    }
    
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("EdoCuarto{idedoCuarto=").append(idedoCuarto);
        sb.append(", edoCuarto=").append(edoCuarto);
        sb.append('}');
        return sb.toString();
    }
    
    
}
