/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.web.bean;

import com.ipn.mx.modelo.dao.CuartoDAO;
import com.ipn.mx.modelo.dto.CuartoDTO;
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
@Named(value = "cuartoMB")
@SessionScoped
public class CuartoMB extends BaseBean implements Serializable {
    private CuartoDTO dto;
    private CuartoDAO dao;
    private List<CuartoDTO> listaDeCuartos;
    
    public CuartoMB() {
    }
    
    @PostConstruct
    public void init(){
        listaDeCuartos = new ArrayList<>();
        listaDeCuartos = dao.readAll();
    }
    
    public String nuevo(){
        dto = new CuartoDTO();
        setAccion(ACC_CREAR);
        
        return "/cuarto/FormCuarto?faces-redirect=true";
    }
    
    public String editar(){
        setAccion(ACC_ACTUALIZAR);
        
        return "/cuarto/FormCuarto?faces-redirect=true";
    } 
    
    public String back(){
        init();
        
        return "/cuarto/AdminCuarto?faces-redirect=true";
    }
    
    public String prepareIndex(){
        init();
        
        return "/cuarto/AdminCuarto?faces-redirect=true";
    }
    
    public String crear(){
        try{
            dao.create(dto);
            
            return prepareIndex();
        }catch(Exception e){
            error("ErrorCrearCuarto", "Error al crear cuarto");
            return "/cuarto/FormCuarto?faces-redirect=true";
        }
    }
    
    public String actualizar(){
        try{
            dao.update(dto);
            
            return prepareIndex();
        }catch(Exception e){
            error("ErrorActualizarCuarto", "Error al actualizar cuarto");
            return "/cuarto/FormCuarto?faces-redirect=true";
        }
    }
    
    public String borrar(){
        try{
            dao.delete(dto);
            
            return prepareIndex();
        }catch(Exception e){
            error("ErrorBorrarCuarto", "Error al borrar cuarto");
            return "/cuarto/FormCuarto?faces-redirect=true";
        }
    }
    
    public void seleccionarCuarto(ActionEvent event) {
        String claveSel = (String) FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("claveSel");
        dto = new CuartoDTO();
        dto.getEntidad().setNoCuarto(Integer.parseInt(claveSel));
        try {
            dto = dao.read(dto);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public CuartoDTO getDto() {
        return dto;
    }

    public void setDto(CuartoDTO dto) {
        this.dto = dto;
    }

    public CuartoDAO getDao() {
        return dao;
    }

    public void setDao(CuartoDAO dao) {
        this.dao = dao;
    }

    public List<CuartoDTO> getListaDeCuartos() {
        return listaDeCuartos;
    }

    public void setListaDeCuartos(List<CuartoDTO> listaDeCuartos) {
        this.listaDeCuartos = listaDeCuartos;
    }
}
