/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.web.bean;

import com.ipn.mx.modelo.dao.EstadoDAO;
import com.ipn.mx.modelo.dao.MunicipioDAO;
import com.ipn.mx.modelo.dao.PacienteDAO;
import com.ipn.mx.modelo.dto.EstadoDTO;
import com.ipn.mx.modelo.dto.MunicipioDTO;
import com.ipn.mx.modelo.dto.PacienteDTO;
import com.ipn.mx.modelo.entidades.Estado;
import com.ipn.mx.modelo.entidades.Municipio;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.model.SelectItem;

/**
 *
 * @author yirz
 */
@Named(value = "pacienteMB")
@SessionScoped
public class PacienteMB extends BaseBean implements Serializable{
    private PacienteDTO dto;
    private PacienteDAO dao = new PacienteDAO();
    private List<PacienteDTO> listaDePacientes;
    private List<SelectItem> listaMunicipios;
    /**
     * Creates a new instance of UsuarioMB
     */
    public PacienteMB() {
    }
    
    @PostConstruct
    public void init(){
        listaDePacientes = new ArrayList<>();
        listaMunicipios = new ArrayList<>();
        listaDePacientes = dao.readAll();
    }
    public String nuevo(){
        dto = new PacienteDTO();
        this.setAccion(ACC_CREAR);
        
        return "/paciente/FormPaciente?faces-redirect=true";
    }
    
    public String editar(){
        this.setAccion(ACC_ACTUALIZAR);
        return "/paciente/FormPaciente?faces-redirect=true";
    } 
    public String back(){
        init();
        
        return "/paciente/AdminPaciente?faces-redirect=true";
    }
    
    public String prepareIndex(){
        init();
        
         return "/paciente/AdminPaciente?faces-redirect=true";
    }
    public String crear(){
        try{
            dao.create(dto);
            return prepareIndex();
        }catch(Exception e){
            error("ErrorCrearEvento", "Error al crear el evento");
            return "/paciente/FormPaciente?faces-redirect=true";
        }
    }
    public String actualizar(){
        try{
            dao.update(dto);
            
            return prepareIndex();
        }catch(Exception e){
            error("ErrorActualizarEvento", "Error al actualizar el evento");
            return "/paciente/FormPaciente?faces-redirect=true";
        }
    }
    
    public String borrar(){
        try{
            dao.delete(dto);
            return prepareIndex();
        }catch(Exception e){
            error("ErrorBorrarEvento", "Error al borrar el evento");
            return "/paciente/AdminPaciente?faces-redirect=true";
        }
    }
    public void seleccionarEvento(ActionEvent event) {
        String claveSel = (String) FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("clave");    
        dto = new PacienteDTO();
        dto.getEntidad().setCurp(claveSel);
        try {
            dto = dao.read(dto);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    public List<SelectItem> getListaEstados(){
        EstadoDAO dao=new EstadoDAO();
        List list=dao.readAll();
        List<SelectItem> select=new ArrayList<>();
        for(int i=0;i<list.size();i++){
            Estado entidad = (Estado) list.get(i);
            select.add(new SelectItem(entidad.getIdestado(),entidad.getNombre()));
        }
        return select;
    }
    public void changeListMunicipios(){
        MunicipioDTO dtoM=new MunicipioDTO();
        MunicipioDAO daoM=new MunicipioDAO();
        listaMunicipios=new ArrayList<>();
        dtoM.getEntidad().setIdestado(dto.getEntidad().getIdestado());
        List<Municipio> list=daoM.readEstado(dtoM);
        for(int i=0;i<list.size();i++){
            listaMunicipios.add(new SelectItem(list.get(i).getIdmunicipio(),list.get(i).getNombre()));
        }
    }
    public PacienteDTO getDto() {
        return dto;
    }

    public void setDto(PacienteDTO dto) {
        this.dto = dto;
    }

    public PacienteDAO getDao() {
        return dao;
    }

    public void setDao(PacienteDAO dao) {
        this.dao = dao;
    }

    public List<PacienteDTO> getListaDePacientes() {
        return listaDePacientes;
    }

    public void setListaDePacientes(List<PacienteDTO> listaDeUsuarios) {
        this.listaDePacientes = listaDeUsuarios;
    }

    public List<SelectItem> getListaMunicipios() {
        return listaMunicipios;
    }

    public void setListaMunicipios(List<SelectItem> listaMunicipios) {
        this.listaMunicipios = listaMunicipios;
    }
    
    
}
