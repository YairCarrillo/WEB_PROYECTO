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

/**
 *
 * @author yirz
 */
@Entity
@Table(name = "graficahosp")
@Immutable
public class DataGraphHospitalizacion implements Serializable {

    @Id
    @Column(name = "tratamiento", insertable = false, updatable = false)
    private String tratamiento;
    @Column(name = "total", insertable = false, updatable = false)
    private int total;

    public DataGraphHospitalizacion() {
    }

    public String getTratamiento() {
        return tratamiento;
    }

    public void setTratamiento(String tratamiento) {
        this.tratamiento = tratamiento;
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
        sb.append("DataGraphHospitalizacion{tratamiento=").append(tratamiento);
        sb.append(", total=").append(total);
        sb.append('}');
        return sb.toString();
    }
    
}
