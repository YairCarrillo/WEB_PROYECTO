/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.dto;

import com.ipn.mx.modelo.entidades.Usuario;

/**
 *
 * @author yirz
 */
public class UsuarioDTO {

    private Usuario entidad;

    public UsuarioDTO() {
        entidad = new Usuario();
    }

    public Usuario getEntidad() {
        return entidad;
    }

    public void setEntidad(Usuario entidad) {
        this.entidad = entidad;
    }

    @Override
    public String toString() {
       return entidad.toString();
    }

}
