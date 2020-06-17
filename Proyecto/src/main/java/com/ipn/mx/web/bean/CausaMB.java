/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.web.bean;

import com.ipn.mx.modelo.dao.CausaHospDAO;
import com.ipn.mx.modelo.dto.CausaHospDTO;
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
@Named(value = "causaMB")
@SessionScoped
public class CausaMB extends BaseBean implements Serializable {
    private CausaHospDTO dto;
    private CausaHospDAO dao = new CausaHospDAO();
    private List<CausaHospDTO> listaDeCausas;
    
    public CausaMB(){
    }
    
    @PostConstruct
    public void init(){
        listaDeCausas = new ArrayList<>();
        listaDeCausas = dao.readAll();
    }
    
    public String nuevo(){
        dto = new CausaHospDTO();
        setAccion(ACC_CREAR);
        
        return "/causa/FormCausa?faces-redirect=true";
    }
    
    public String editar(){
        setAccion(ACC_ACTUALIZAR);
        
        return "/causa/FormCausa?faces-redirect=true";
    } 
    
    public String back(){
        init();
        
        return "/Principal?faces-redirect=true";
    }
    
    public String prepareIndex(){
        init();
        
        return "/causa/AdminCausa?faces-redirect=true";
    }
    
    public String crear(){
        try{
            dao.create(dto);
            
            return prepareIndex();
        }catch(Exception e){
            error("ErrorCrearCausa", "Error al crear causa");
            return "/causa/FormCausa?faces-redirect=true";
        }
    }
    
    public String actualizar(){
        try{
            dao.update(dto);
            
            return prepareIndex();
        }catch(Exception e){
            error("ErrorActualizarCausa", "Error al actualizar la causa");
            return "/causa/FormCausa?faces-redirect=true";
        }
    }
    
    public String borrar(){
        try{
            dao.delete(dto);
            
            return prepareIndex();
        }catch(Exception e){
            error("ErrorBorrarCausa", "Error al borrar la causa");
            return "/causa/FormCausa?faces-redirect=true";
        }
    }
    
    public void seleccionarCausa(ActionEvent event) {
        String claveSel = (String) FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("claveSel");
        dto = new CausaHospDTO();
        dto.getEntidad().setIdCausaHosp(Integer.parseInt(claveSel));
        try {
            dto = dao.read(dto);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public CausaHospDTO getDto() {
        return dto;
    }

    public void setDto(CausaHospDTO dto) {
        this.dto = dto;
    }

    public CausaHospDAO getDao() {
        return dao;
    }

    public void setDao(CausaHospDAO dao) {
        this.dao = dao;
    }

    public List<CausaHospDTO> getListaDeCausas() {
        return listaDeCausas;
    }

    public void setListaDeCausas(List<CausaHospDTO> listaDeCausas) {
        this.listaDeCausas = listaDeCausas;
    }
}
