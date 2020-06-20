/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.dto;

import com.ipn.mx.modelo.entidades.DataGraphEstadoCuarto;

/**
 *
 * @author yirz
 */
public class DataGraphEstadoCuartoDTO {
    private DataGraphEstadoCuarto entidad;
    
    public DataGraphEstadoCuartoDTO(){
        entidad = new DataGraphEstadoCuarto();
    }

    public DataGraphEstadoCuarto getEntidad() {
        return entidad;
    }

    public void setEntidad(DataGraphEstadoCuarto entidad) {
        this.entidad = entidad;
    }

    @Override
    public String toString() {
        return entidad.toString();
    }
    
}
