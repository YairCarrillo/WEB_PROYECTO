/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.entidades;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author yirz
 */
@Entity
@Table(name="medico")
public class Medico implements Serializable{
    @Id
    private  int cedula;
    private String nombre;
    private String dir;
    private int idEsp;
    private int tel;

    public Medico() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDir() {
        return dir;
    }

    public void setDir(String dir) {
        this.dir = dir;
    }

    public int getIdEsp() {
        return idEsp;
    }

    public void setIdEsp(int idEsp) {
        this.idEsp = idEsp;
    }

    public int getTel() {
        return tel;
    }

    public void setTel(int tel) {
        this.tel = tel;
    }
    
    public int getCedula() {
        return cedula;
    }

    public void setCedula(int cedula) {
        this.cedula = cedula;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Paciente{cedula=").append(cedula);
        sb.append(", nombre=").append(nombre);
        sb.append(", dir=").append(dir);
        sb.append(", idEsp=").append(idEsp);
        sb.append(", tel=").append(tel);
        sb.append('}');
        return sb.toString();
    }
    
}
