/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.web.bean;

import com.ipn.mx.modelo.dao.UsuarioDAO;
import com.ipn.mx.modelo.dto.UsuarioDTO;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;



/**
 *
 * @author yirz
 */
@Named(value = "usuarioMB")
@SessionScoped
public class UsuarioMB extends BaseBean implements Serializable{
    private UsuarioDTO dto;
    private UsuarioDAO dao = new UsuarioDAO();
    private List<UsuarioDTO> listaDeUsuarios; 
    /**
     * Creates a new instance of UsuarioMB
     */
    public UsuarioMB() {
    }
    
    @PostConstruct
    public void init(){
        listaDeUsuarios = new ArrayList<>();
        listaDeUsuarios = dao.readAll();
    }
    public String nuevo(){
        dto = new UsuarioDTO();
        this.setAccion(ACC_CREAR);
        
        return "/usuario/FormUsuario?faces-redirect=true";
    }
    
    public String editar(){
        this.setAccion(ACC_ACTUALIZAR);
        return "/usuario/FormUsuario?faces-redirect=true";
    } 
    public String back(){
        init();
        
        return "/usuario/AdminUsuario?faces-redirect=true";
    }
    
    public String prepareIndex(){
        init();
        
        return "/usuario/AdminUsuario?faces-redirect=true";
    }
    public String crear(){
        try{
            dao.create(dto);
            return prepareIndex();
        }catch(Exception e){
            error("ErrorCrearEvento", "Error al crear el evento");
            return "/usuario/FormUsuario?faces-redirect=true";
        }
    }
    public String actualizar(){
        try{
            dao.update(dto);
            
            return prepareIndex();
        }catch(Exception e){
            error("ErrorActualizarEvento", "Error al actualizar el evento");
            return "/usuario/FormUsuario?faces-redirect=true";
        }
    }
    
    public String borrar(){
        try{
            dao.delete(dto);
            return prepareIndex();
        }catch(Exception e){
            error("ErrorBorrarEvento", "Error al borrar el evento");
            return "/usuario/AdminUsuario?faces-redirect=true";
        }
    }
    public void seleccionarEvento(ActionEvent event) {
        String claveSel = (String) FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("clave");    
        dto = new UsuarioDTO();
        dto.getEntidad().setIdusuario(Integer.parseInt(claveSel));
        try {
            dto = dao.read(dto);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    public UsuarioDTO getDto() {
        return dto;
    }

    public void setDto(UsuarioDTO dto) {
        this.dto = dto;
    }

    public UsuarioDAO getDao() {
        return dao;
    }

    public void setDao(UsuarioDAO dao) {
        this.dao = dao;
    }

    public List<UsuarioDTO> getListaDeUsuarios() {
        return listaDeUsuarios;
    }

    public void setListaDeUsuarios(List<UsuarioDTO> listaDeUsuarios) {
        this.listaDeUsuarios = listaDeUsuarios;
    }
    
    
}
