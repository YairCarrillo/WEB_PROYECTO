/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.dto;

import com.ipn.mx.modelo.entidades.Paciente;
import java.io.Serializable;

/**
 *
 * @author yirz
 */
public class PacienteDTO implements Serializable{
    private Paciente entidad;
    
    public PacienteDTO(){
        entidad = new Paciente();
    }

    public Paciente getEntidad() {
        return entidad;
    }

    public void setEntidad(Paciente entidad) {
        this.entidad = entidad;
    }
}
