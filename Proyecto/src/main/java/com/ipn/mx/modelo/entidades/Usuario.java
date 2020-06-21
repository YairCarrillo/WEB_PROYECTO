/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.entidades;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import org.hibernate.annotations.Type;

/**
 *
 * @author yirz
 */
@Entity
@Table(name = "usuario")
public class Usuario implements Serializable{
    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idusuario;
    private String correo;
    private String password;
    private String nombreusuario;   
    private String paterno;
    private String materno;
    private String nombre;
    @Lob
    @Column(name="foto")
    @Type(type="org.hibernate.type.BinaryType")
    private byte[] foto;
    public Usuario() {
    }
    
    public int getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNombreusuario() {
        return nombreusuario;
    }

    public void setNombreusuario(String nombreusuario) {
        this.nombreusuario = nombreusuario;
    }

    public String getPaterno() {
        return paterno;
    }

    public void setPaterno(String paterno) {
        this.paterno = paterno;
    }

    public String getMaterno() {
        return materno;
    }

    public void setMaterno(String materno) {
        this.materno = materno;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public byte[] getFoto() {
        return foto;
    }

    public void setFoto(byte[] foto) {
        this.foto = foto;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Usuario{idusuario=").append(idusuario);
        sb.append(", correo=").append(correo);
        sb.append(", password=").append(password);
        sb.append(", nombreusuario=").append(nombreusuario);
        sb.append(", paterno=").append(paterno);
        sb.append(", materno=").append(materno);
        sb.append(", nombre=").append(nombre);
        sb.append(", foto=").append(foto);
        sb.append('}');
        return sb.toString();
    }
    
    
}
