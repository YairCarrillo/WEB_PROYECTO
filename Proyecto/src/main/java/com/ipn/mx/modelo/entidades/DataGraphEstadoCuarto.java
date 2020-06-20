/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.entidades;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.Immutable;
import org.hibernate.annotations.Subselect;

/**
 *
 * @author yirz
 */
@Entity
@Table(name="grafica")
@Immutable
public class DataGraphEstadoCuarto implements Serializable{
    @Id
    @Column(name="edocuarto", insertable = false, updatable = false)
    private String edocuarto;
    @Column(insertable = false,updatable = false)
    private int total;

    public DataGraphEstadoCuarto() {
    }
    
    public String getEdocuarto() {
        return edocuarto;
    }

    public void setEdocuarto(String edocuarto) {
        this.edocuarto = edocuarto;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("DataGraphEstadoCuarto{edocuarto=").append(edocuarto);
        sb.append(", total=").append(total);
        sb.append('}');
        return sb.toString();
    }
    
    
}