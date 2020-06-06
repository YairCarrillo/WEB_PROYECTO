/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.dto;

import com.ipn.mx.modelo.entidades.Cuarto;

/**
 *
 * @author jonathan
 */
public class CuartoDTO {
    private Cuarto entidad;
    
    public CuartoDTO(){
        entidad = new Cuarto();
    }

    public Cuarto getEntidad() {
        return entidad;
    }

    public void setEntidad(Cuarto entidad) {
        this.entidad = entidad;
    }
}
