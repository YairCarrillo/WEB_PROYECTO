/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.dao;

import com.ipn.mx.modelo.dto.UsuarioDTO;
import com.ipn.mx.modelo.entidades.Usuario;
import com.ipn.mx.util.HibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author yirz
 */
public class UsuarioDAO {
    public void create(UsuarioDTO dto){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        
        try{
            transaction.begin();
            session.save(dto.getEntidad());
            transaction.commit();
        }catch(HibernateException he){
            if(transaction != null && transaction.isActive()){
                transaction.rollback();
            }
        }
        finally {
            if (session != null) {
                session.close();
            }
        }
    }
    
    public void update(UsuarioDTO dto){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        
        try{
            transaction.begin();
            session.update(dto.getEntidad());
            transaction.commit();
        }catch(HibernateException he){
            if(transaction != null && transaction.isActive()){
                transaction.rollback();
            }
        }
        finally {
            if (session != null) {
                session.close();
            }
        }
    }
    
    public void delete(UsuarioDTO dto){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        
        try{
            transaction.begin();
            session.delete(dto.getEntidad());
            transaction.commit();
        }catch(HibernateException he){
            if(transaction != null && transaction.isActive()){
                transaction.rollback();
            }
        }
        finally {
            if (session != null) {
                session.close();
            }
        }
    }
    
    public UsuarioDTO read(UsuarioDTO dto){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        
        try{
            transaction.begin();
            dto.setEntidad(session.get(dto.getEntidad().getClass(), dto.getEntidad().getIdusuario()));
            transaction.commit();
        }catch(HibernateException he){
            if(transaction != null && transaction.isActive()){
                transaction.rollback();
            }
        }
        finally {
            if (session != null) {
                session.close();
            }
        }
        return dto;
    }
    
    public List<UsuarioDTO> readAll(){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        transaction.begin();
        List<UsuarioDTO> lista;
        Query query = session.createQuery("from Usuario h order by h.idusuario");
        lista = query.list();
        transaction.commit();
        session.close();
        return lista;       
    }
    
    public UsuarioDTO login(UsuarioDTO dto){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        List lista = null;
        try{
            transaction.begin();
            Query query = session.createSQLQuery("select * from Usuario h where h.nombreusuario=:u and h.password=:p").addEntity(Usuario.class)
                    .setParameter("u", dto.getEntidad().getNombreusuario())
                    .setParameter("p", dto.getEntidad().getPassword());
            lista = query.list();
            transaction.commit();

            if(lista.size() > 0){
                dto.setEntidad((Usuario) lista.get(0));

                return dto;
            }else{
                return null;
            } 
        }catch(HibernateException ex){
            if(transaction != null && transaction.isActive()){
                transaction.rollback();
            }
        }
        finally {
            if (session != null) {
                session.close();
            }
        }
        
        return dto;
    }
    
    public static void main(String[] args) {
        UsuarioDTO dto=new UsuarioDTO();
        //dto.getEntidad().setNombre("Jonathan");
        //dto.getEntidad().setPaterno("Perez");
        //dto.getEntidad().setMaterno("Perez");
        dto.getEntidad().setNombreusuario("admin");
        dto.getEntidad().setPassword("admin");
        //dto.getEntidad().setCorreo("Hola que hace");
        UsuarioDAO dao=new UsuarioDAO();
        dao.login(dto);
        System.out.println(dto);
    }
}
