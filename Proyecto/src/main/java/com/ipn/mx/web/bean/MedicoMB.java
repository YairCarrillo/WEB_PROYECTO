/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.web.bean;

import com.ipn.mx.modelo.dao.EspecialidadDAO;
import com.ipn.mx.modelo.dao.MedicoDAO;
import com.ipn.mx.modelo.dto.MedicoDTO;
import com.ipn.mx.modelo.entidades.Especialidad;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.inject.Named;
import javax.enterprise.context.Dependent;
import javax.enterprise.context.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.model.SelectItem;

/**
 *
 * @author yirz
 */
@Named(value = "medicoMB")
@SessionScoped
public class MedicoMB extends BaseBean implements Serializable{
    private MedicoDTO dto;
    private MedicoDAO dao = new MedicoDAO();
    private List<MedicoDTO> listaDeMedicos; 
    /**
     * Creates a new instance of UsuarioMB
     */
    public MedicoMB() {
    }
    
    @PostConstruct
    public void init(){
        listaDeMedicos = new ArrayList<>();
        listaDeMedicos = dao.readAll();
    }
    public String nuevo(){
        dto = new MedicoDTO();
        this.setAccion(ACC_CREAR);
        
        return "/medico/FormMedico?faces-redirect=true";
    }
    
    public String editar(){
        this.setAccion(ACC_ACTUALIZAR);
        return "/medico/FormMedico?faces-redirect=true";
    } 
    public String back(){
        init();
        
        return "/medico/AdminMedico?faces-redirect=true";
    }
    
    public String prepareIndex(){
        init();
        
        return "/medico/AdminMedico?faces-redirect=true";
    }
    public String crear(){
        try{
            dao.create(dto);
            return prepareIndex();
        }catch(Exception e){
            error("ErrorCrearMedico", "Error al registrar Medico");
            return "/medico/FormMedico?faces-redirect=true";
        }
    }
    public String actualizar(){
        try{
            dao.update(dto);
            
            return prepareIndex();
        }catch(Exception e){
            error("ErrorActualizarEvento", "Error al actualizar Medico");
            return "/medico/FormMedico?faces-redirect=true";
        }
    }
    
    public String borrar(){
        try{
            dao.delete(dto);
            return prepareIndex();
        }catch(Exception e){
            error("ErrorBorrarEvento", "Error al borrar el evento");
            return "/medico/AdminMedico?faces-redirect=true";
        }
    }
    public void seleccionarMedico(ActionEvent event) {
        String claveSel = (String) FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("clave");    
        dto = new MedicoDTO();
        dto.getEntidad().setCedula(Integer.parseInt(claveSel));
        try {
            dto = dao.read(dto);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    public List<SelectItem> getListEspecialidades(){
        EspecialidadDAO daoE=new EspecialidadDAO();
        List lista= daoE.readAll();
        List <SelectItem> listaSelect=new ArrayList<>();
        for(int i=0;i<lista.size();i++){
            Especialidad entidad = (Especialidad) lista.get(i);
            listaSelect.add(new SelectItem(entidad.getIdesp(),entidad.getDescesp()));
        }
        return listaSelect;
    }
    public MedicoDTO getDto() {
        return dto;
    }

    public void setDto(MedicoDTO dto) {
        this.dto = dto;
    }

    public MedicoDAO getDao() {
        return dao;
    }

    public void setDao(MedicoDAO dao) {
        this.dao = dao;
    }

    public List<MedicoDTO> getListaDeMedicos() {
        return listaDeMedicos;
    }

    public void setListaDeMedicos(List<MedicoDTO> listaDeUsuarios) {
        this.listaDeMedicos = listaDeUsuarios;
    }
    
}
