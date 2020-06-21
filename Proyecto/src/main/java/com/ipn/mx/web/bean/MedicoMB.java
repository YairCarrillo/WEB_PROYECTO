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
import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.inject.Named;
import javax.enterprise.context.Dependent;
import javax.enterprise.context.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.model.SelectItem;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;

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
    
    public String reporte(){
        String relativeWebPath = FacesContext.getCurrentInstance().getExternalContext().getRealPath("/reportes/Medico.jasper");
        File archivo = new File(relativeWebPath);
        Map parametros = new HashMap();
        parametros.put("id", dto.getEntidad().getCedula());
        
        try {
            byte[] bytes = JasperRunManager.runReportToPdf(archivo.getPath(), parametros, dao.getConnection());
            HttpServletResponse response = (HttpServletResponse) FacesContext.getCurrentInstance().getExternalContext().getResponse();
            ServletOutputStream sos = response.getOutputStream();
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            sos.write(bytes, 0, bytes.length);
            sos.flush();
            sos.close();
            
            FacesContext.getCurrentInstance().responseComplete();
            
        } catch (SQLException ex) {
            Logger.getLogger(HistorialMB.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JRException ex) {
            Logger.getLogger(HistorialMB.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(HistorialMB.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return "/medico/ReportePage?faces-redirect=true";
    }
    
    public String reporteAll(){
        String relativeWebPath = FacesContext.getCurrentInstance().getExternalContext().getRealPath("/reportes/Lista_Medicos.jasper");
        File archivo = new File(relativeWebPath);
        
        try {
            byte[] bytes = JasperRunManager.runReportToPdf(archivo.getPath(), null, dao.getConnection());
            HttpServletResponse response = (HttpServletResponse) FacesContext.getCurrentInstance().getExternalContext().getResponse();
            ServletOutputStream sos = response.getOutputStream();
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            sos.write(bytes, 0, bytes.length);
            sos.flush();
            sos.close();
            
            FacesContext.getCurrentInstance().responseComplete();
            
        } catch (SQLException ex) {
            Logger.getLogger(HistorialMB.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JRException ex) {
            Logger.getLogger(HistorialMB.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(HistorialMB.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return "/medico/ReportePage?faces-redirect=true";
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
