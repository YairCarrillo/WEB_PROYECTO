/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.web.bean;

import com.ipn.mx.modelo.dao.EdoCuartoDAO;
import com.ipn.mx.modelo.dto.EdoCuartoDTO;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

/**
 *
 * @author jonathan
 */
@Named(value = "edoCuartoMB")
@SessionScoped
public class EdoCuartoMB extends BaseBean implements Serializable {
    private EdoCuartoDTO dto;
    private EdoCuartoDAO dao;
    private List<EdoCuartoDTO> lista;
    
    public EdoCuartoMB() {
    }
    
    @PostConstruct
    public void init(){
        lista = new ArrayList<>();
        lista = dao.readAll();
    }
    
    public String nuevo(){
        dto = new EdoCuartoDTO();
        setAccion(ACC_CREAR);
        
        return "/edocuarto/FormEdoCuarto?faces-redirect=true";
    }
    
    public String editar(){
        setAccion(ACC_ACTUALIZAR);
        
        return "/edocuarto/FormEdoCuarto?faces-redirect=true";
    } 
    
    public String back(){
        init();
        
        return "/Principal?faces-redirect=true";
    }
    
    public String prepareIndex(){
        init();
        
        return "/edocuarto/AdminEdoCuarto?faces-redirect=true";
    }
    
    public String crear(){
        try{
            dao.create(dto);
            
            return prepareIndex();
        }catch(Exception e){
            error("ErrorCrearEdoCuarto", "Error al crear estado del cuarto");
            return "/edocuarto/FormEdoCuarto?faces-redirect=true";        }
    }
    
    public String actualizar(){
        try{
            dao.update(dto);
            
            return prepareIndex();
        }catch(Exception e){
            error("ErrorActualizarEdoCuarto", "Error al actualizar estado del cuarto");
            return "/edocuarto/FormEdoCuarto?faces-redirect=true";
        }
    }
    
    public String borrar(){
        try{
            dao.delete(dto);
            
            return prepareIndex();
        }catch(Exception e){
            error("ErrorBorrarEdoCuarto", "Error al borrar estado del cuarto");
            return "/edocuarto/FormEdoCuarto?faces-redirect=true";
        }
    }
    
    public void seleccionarEdoCuarto(ActionEvent event) {
        String claveSel = (String) FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("claveSel");
        dto = new EdoCuartoDTO();
        dto.getEntidad().setIdedoCuarto(claveSel);
        
        try {
            dto = dao.read(dto);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public EdoCuartoDTO getDto() {
        return dto;
    }

    public void setDto(EdoCuartoDTO dto) {
        this.dto = dto;
    }

    public EdoCuartoDAO getDao() {
        return dao;
    }

    public void setDao(EdoCuartoDAO dao) {
        this.dao = dao;
    }

    public List<EdoCuartoDTO> getLista() {
        return lista;
    }

    public void setLista(List<EdoCuartoDTO> lista) {
        this.lista = lista;
    }
}
