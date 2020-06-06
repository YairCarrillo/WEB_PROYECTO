/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.dto;

import com.ipn.mx.modelo.entidades.Historial;

/**
 *
 * @author jonathan
 */
public class HistorialDTO {
    private Historial entidad;
    
    public HistorialDTO(){
        entidad = new Historial();
    }

    public Historial getEntidad() {
        return entidad;
    }

    public void setEntidad(Historial entidad) {
        this.entidad = entidad;
    }
}
