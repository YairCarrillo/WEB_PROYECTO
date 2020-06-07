/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.dto;

import com.ipn.mx.modelo.entidades.Especialidad;
import java.io.Serializable;

/**
 *
 * @author yirz
 */
public class EspecialidadDTO implements Serializable {
    private Especialidad entidad;
    
    public EspecialidadDTO(){
        entidad = new Especialidad();
    }

    public Especialidad getEntidad() {
        return entidad;
    }

    public void setEntidad(Especialidad entidad) {
        this.entidad = entidad;
    }
    
}
