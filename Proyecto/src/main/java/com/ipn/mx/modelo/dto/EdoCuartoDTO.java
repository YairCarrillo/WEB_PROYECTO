/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.dto;

import com.ipn.mx.modelo.entidades.EdoCuarto;

/**
 *
 * @author jonathan
 */
public class EdoCuartoDTO {
    private EdoCuarto entidad;
    
    public EdoCuartoDTO(){
        entidad = new EdoCuarto();
    }

    public EdoCuarto getEntidad() {
        return entidad;
    }

    public void setEntidad(EdoCuarto entidad) {
        this.entidad = entidad;
    }
}
