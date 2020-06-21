/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.web.bean;

import com.ipn.mx.modelo.dao.UsuarioDAO;
import com.ipn.mx.modelo.dto.UsuarioDTO;
import com.ipn.mx.util.Email;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.validator.ValidatorException;
import org.postgresql.shaded.com.ongres.scram.common.bouncycastle.base64.Base64;
import org.primefaces.model.file.UploadedFile;




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
    private UploadedFile file;
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
            Email email=new Email();
            String asunto="Registro Exitoso";
            String contenido="Se a registro de manera exitosa bajo los siguiente parametras\n"
                    + "Nombre de Usuario: "+dto.getEntidad().getNombreusuario()+"\n"
                    + "Contraseña:"+dto.getEntidad().getPassword()+"\n";
            email.enviarEmail(dto.getEntidad().getCorreo(),asunto,contenido);
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
            error("ErrorActuCorreoalizarEvento", "Error al actualizar el evento");
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
    public void validateUserName(FacesContext facesContext,
      UIComponent component, Object value){
        UsuarioDTO aux=new UsuarioDTO();
        aux.getEntidad().setNombreusuario(value.toString());
        aux =dao.UserName(aux);
        if(aux!=null){
            throw new ValidatorException(new FacesMessage("Nombre de Usuario Existente"));
        }
    }
    public void upload(){
        if(file!=null){
            dto.getEntidad().setFoto(file.getContent());
        }
    }
    public String base64Img(byte[] foto){
        return new String(java.util.Base64.getEncoder().encodeToString(foto));
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

    public UploadedFile getFile() {
        return file;
    }

    public void setFile(UploadedFile file) {
        this.file = file;
    }
    
}
