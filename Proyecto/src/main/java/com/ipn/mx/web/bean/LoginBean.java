/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.web.bean;

import com.ipn.mx.modelo.dao.UsuarioDAO;
import com.ipn.mx.modelo.dto.UsuarioDTO;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import javax.annotation.PostConstruct;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jonathan
 */
@Named(value = "loginBean")
@SessionScoped
public class LoginBean extends BaseBean implements Serializable {
    private UsuarioDTO dto;
    private UsuarioDAO dao;
    
    public LoginBean(){
    }
    
    @PostConstruct
    public void init(){
        dto = new UsuarioDTO();
        dao = new UsuarioDAO();
    }
    
    public String login(){
        
        if(dao.login(dto) != null){
            HttpSession session = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(true);
            session.setAttribute("nombreUsuario", dto.getEntidad().getNombreusuario());

            return "/Principal?faces-redirect=true";
        }else{
            return "/index?faces-redirect=true";
        }
    }
    
    public String logout(){
        HttpSession session = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
        session.removeAttribute("nombreUsuario");
        
        if(session != null){
            session.invalidate();
        }
        
        return "/index?faces-redirect=true";
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
}
