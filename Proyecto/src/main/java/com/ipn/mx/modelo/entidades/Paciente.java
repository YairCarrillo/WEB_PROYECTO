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
@Table(name="paciente")
public class Paciente implements Serializable{
   
   @Id
   private String curp;
   private String nombre;
   private int edad;
   private String dir;
   private int tel;

    public Paciente() {
    }

    public String getCurp() {
        return curp;
    }

    public void setCurp(String curp) {
        this.curp = curp;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getDir() {
        return dir;
    }

    public void setDir(String dir) {
        this.dir = dir;
    }

    public int getTel() {
        return tel;
    }

    public void setTel(int tel) {
        this.tel = tel;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Paciente{curp=").append(curp);
        sb.append(", nombre=").append(nombre);
        sb.append(", edad=").append(edad);
        sb.append(", dir=").append(dir);
        sb.append(", tel=").append(tel);
        sb.append('}');
        return sb.toString();
    }   
}
