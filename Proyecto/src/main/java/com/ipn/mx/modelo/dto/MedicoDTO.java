/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.dto;

import com.ipn.mx.modelo.entidades.Medico;
import java.io.Serializable;

/**
 *
 * @author yirz
 */
public class MedicoDTO implements Serializable{
    private Medico entidad;
    
    public MedicoDTO(){
        entidad = new Medico();
    }

    public Medico getEntidad() {
        return entidad;
    }

    public void setEntidad(Medico entidad) {
        this.entidad = entidad;
    }
    
}
