/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.web.bean;

import com.ipn.mx.modelo.dao.HistorialDAO;
import com.ipn.mx.modelo.dto.HistorialDTO;
import java.io.File;
import java.io.IOException;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;


/**
 *
 * @author jonathan
 */
@Named(value = "historialMB")
@SessionScoped
public class HistorialMB extends BaseBean implements Serializable {
    private HistorialDTO dto;
    private HistorialDAO dao = new HistorialDAO();
    private List<HistorialDTO> listaDeHistoriales;
    
    public HistorialMB() {
    }
    
    @PostConstruct
    public void init(){
        listaDeHistoriales = new ArrayList<>();
        listaDeHistoriales = dao.readAll();
    }
    
    public String nuevo(){
        dto = new HistorialDTO();
        setAccion(ACC_CREAR);
        
        return "/historial/FormHistorial?faces-redirect=true";
    }
    
    public String editar(){
        setAccion(ACC_ACTUALIZAR);
        
        return "/historial/FormHistorial?faces-redirect=true&action=ACTUALIZAR";
    } 
    
    public String back(){
        init();
        
        return "/historial/AdminHistorial?faces-redirect=true";
    }
    
    public String prepareIndex(){
        init();
        
        return "/historial/AdminHistorial?faces-redirect=true";
    }
    
    public String crear(){
        try{
            dao.create(dto);
            
            return prepareIndex();
        }catch(Exception e){
            error("ErrorCrearHistorial", "Error al crear historial");
            return "/historial/FormHistorial?faces-redirect=true";        }
    }
    
    public String actualizar(){
        try{
            dao.update(dto);
            
            return prepareIndex();
        }catch(Exception e){
            error("ErrorActualizarHistorial", "Error al actualizar historial");
            return "/historial/FormHistorial?faces-redirect=true";
        }
    }
    
    public String borrar(){
        try{
            dao.delete(dto);
            
            return prepareIndex();
        }catch(Exception e){
            error("ErrorBorrarHistorial", "Error al borrar historial");
            return "/historial/FormHistorial?faces-redirect=true";
        }
    }
    
    public String reporte(){
        String relativeWebPath = FacesContext.getCurrentInstance().getExternalContext().getRealPath("/reportes/Historial.jasper");
        File archivo = new File(relativeWebPath);
        Map parametros = new HashMap();
        parametros.put("id", dto.getEntidad().getIdhistorial());
        
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
        
        return "/historial/ReportePage?faces-redirect=true";
    }
    
    public void seleccionarHistorial(ActionEvent event) {
        String claveSel = (String) FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("claveSel");
        dto = new HistorialDTO();
        dto.getEntidad().setIdhistorial(Integer.parseInt(claveSel));
        
        try {
            dto = dao.read(dto);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public HistorialDTO getDto() {
        return dto;
    }

    public void setDto(HistorialDTO dto) {
        this.dto = dto;
    }

    public HistorialDAO getDao() {
        return dao;
    }

    public void setDao(HistorialDAO dao) {
        this.dao = dao;
    }

    public List<HistorialDTO> getListaDeHistoriales() {
        return listaDeHistoriales;
    }

    public void setListaDeHistoriales(List<HistorialDTO> listaDeHistoriales) {
        this.listaDeHistoriales = listaDeHistoriales;
    }
}
