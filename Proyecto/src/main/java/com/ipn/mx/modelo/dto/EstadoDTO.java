/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.dto;

import com.ipn.mx.modelo.entidades.Estado;

/**
 *
 * @author yirz
 */
public class EstadoDTO {
    private Estado entidad;
    
    public EstadoDTO(){
        entidad = new Estado();
    }

    public Estado getEntidad() {
        return entidad;
    }

    public void setEntidad(Estado entidad) {
        this.entidad = entidad;
    }

    @Override
    public String toString() {
        return entidad.toString();
    }
}
