/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.dao;

import com.ipn.mx.modelo.dto.EspecialidadDTO;
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
public class EspecialidadDAO {
    public void create(EspecialidadDTO dto){
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
    
    public void update(EspecialidadDTO dto){
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
    
    public void delete(EspecialidadDTO dto){
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
    
    public EspecialidadDTO read(EspecialidadDTO dto){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        
        try{
            transaction.begin();
            dto.setEntidad(session.get(dto.getEntidad().getClass(), dto.getEntidad().getIdesp()));
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
    
    public List<EspecialidadDTO> readAll(){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        transaction.begin();
        List<EspecialidadDTO> lista;
        Query query = session.createQuery("from Especialidad h order by h.idesp");
        lista = query.list();
        transaction.commit();
        session.close();
        return lista;       
    }
    public static void main(String[] args) {
        //MunicipioDTO dto=new MunicipioDTO();
        //dto.getEntidad().setIdestado(1);
        EspecialidadDAO dao=new EspecialidadDAO();
        System.out.println(dao.readAll());
    }
}
