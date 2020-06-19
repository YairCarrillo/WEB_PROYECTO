/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.web.bean;

import com.ipn.mx.modelo.dao.EspecialidadDAO;
import com.ipn.mx.modelo.dto.EspecialidadDTO;
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
@Named(value = "especialidadMB")
@SessionScoped
public class EspecialidadMB extends BaseBean implements Serializable{
    private EspecialidadDTO dto;
    private EspecialidadDAO dao = new EspecialidadDAO();
    private List<EspecialidadDTO> listaDeEspecialidades; 
    /**
     * Creates a new instance of UsuarioMB
     */
    public EspecialidadMB() {
    }
    
    @PostConstruct
    public void init(){
        listaDeEspecialidades = new ArrayList<>();
        listaDeEspecialidades = dao.readAll();
    }
    public String nuevo(){
        dto = new EspecialidadDTO();
        this.setAccion(ACC_CREAR);
        
        return "/especialidad/FormEspecialidad?faces-redirect=true";
    }
    
    public String editar(){
        this.setAccion(ACC_ACTUALIZAR);
        return "/especialidad/FormEspecialidad?faces-redirect=true";
    } 
    public String back(){
        init();
        
        return "/especialidad/AdminEspecialidad?faces-redirect=true";
    }
    
    public String prepareIndex(){
        init();
        
        return "/especialidad/AdminEspecialidad?faces-redirect=true";
    }
    public String crear(){
        try{
            dao.create(dto);
            return prepareIndex();
        }catch(Exception e){
            error("ErrorCrearEspecialidad", "Error al crear el evento");
            return "/especialidad/FormEspecialidad?faces-redirect=true";
        }
    }
    public String actualizar(){
        try{
            dao.update(dto);
            
            return prepareIndex();
        }catch(Exception e){
            error("ErrorActualizarEspecialidad", "Error al actualizar el evento");
            return "/especialidad/FormEspecialidad?faces-redirect=true";
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
    public void seleccionarEspecialidad(ActionEvent event) {
        String claveSel = (String) FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("clave");    
        dto = new EspecialidadDTO();
        dto.getEntidad().setIdesp(claveSel);
        try {
            dto = dao.read(dto);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    public EspecialidadDTO getDto() {
        return dto;
    }

    public void setDto(EspecialidadDTO dto) {
        this.dto = dto;
    }

    public EspecialidadDAO getDao() {
        return dao;
    }

    public void setDao(EspecialidadDAO dao) {
        this.dao = dao;
    }

    public List<EspecialidadDTO> getListaDeUsuarios() {
        return listaDeEspecialidades;
    }

    public void setListaDeUsuarios(List<EspecialidadDTO> listaDeUsuarios) {
        this.listaDeEspecialidades = listaDeUsuarios;
    }
}
