/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.dao;

import com.ipn.mx.modelo.dto.EdoCuartoDTO;
import com.ipn.mx.util.HibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author jonathan
 */
public class EdoCuartoDAO {
    public void create(EdoCuartoDTO dto){
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
    }
    
    public void update(EdoCuartoDTO dto){
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
    }
    
    public void delete(EdoCuartoDTO dto){
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
    }
    
    public EdoCuartoDTO read(EdoCuartoDTO dto){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        
        try{
            transaction.begin();
            dto.setEntidad(session.get(dto.getEntidad().getClass(), dto.getEntidad().getIdedoCuarto()));
            transaction.commit();
        }catch(HibernateException he){
            if(transaction != null && transaction.isActive()){
                transaction.rollback();
            }
        }
        return dto;
    }
    
    public List<EdoCuartoDTO> readAll(){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        transaction.begin();
        List<EdoCuartoDTO> lista;
        Query query = session.createQuery("from EdoCuarto e order by e.idedoCuarto");
        lista = query.list();
        transaction.commit();
        return lista;       
    }
}
