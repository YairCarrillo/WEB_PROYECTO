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
@Table(name="estado")
public class Estado implements Serializable{
    @Id
    private int idestado;
    private String clave;
    private String nombre;
    private String abrev;
    private int activo;

    public Estado() {
    }

    public int getIdestado() {
        return idestado;
    }

    public void setIdestado(int idestado) {
        this.idestado = idestado;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getAbrev() {
        return abrev;
    }

    public void setAbrev(String abrev) {
        this.abrev = abrev;
    }

    public int getActivo() {
        return activo;
    }

    public void setActivo(int activo) {
        this.activo = activo;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Estado{idestado=").append(idestado);
        sb.append(", clave=").append(clave);
        sb.append(", nombre=").append(nombre);
        sb.append(", abrev=").append(abrev);
        sb.append(", activo=").append(activo);
        sb.append('}');
        return sb.toString();
    }
    
}
