/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.dto;

import com.ipn.mx.modelo.entidades.DataGraphHospitalizacion;

/**
 *
 * @author yirz
 */
public class DataGraphHospitalizacionDTO {
    private DataGraphHospitalizacion entidad;
    
    public DataGraphHospitalizacionDTO(){
        entidad = new DataGraphHospitalizacion();
    }

    public DataGraphHospitalizacion getEntidad() {
        return entidad;
    }

    public void setEntidad(DataGraphHospitalizacion entidad) {
        this.entidad = entidad;
    }

    @Override
    public String toString() {
        return entidad.toString();
    }
}
