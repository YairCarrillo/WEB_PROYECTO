/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.dto;

import com.ipn.mx.modelo.entidades.CausaHosp;

/**
 *
 * @author jonathan
 */
public class CausaHospDTO {
    private CausaHosp entidad;

    public CausaHospDTO(){
        this.entidad = new CausaHosp();
    }

    public CausaHosp getEntidad() {
        return entidad;
    }

    public void setEntidad(CausaHosp entidad) {
        this.entidad = entidad;
    }
}
