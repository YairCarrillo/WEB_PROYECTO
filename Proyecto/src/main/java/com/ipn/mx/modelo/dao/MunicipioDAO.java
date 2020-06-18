/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.dao;

import com.ipn.mx.modelo.dto.MunicipioDTO;
import com.ipn.mx.modelo.entidades.Municipio;
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
public class MunicipioDAO {
    public void create(MunicipioDTO dto){
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
    
    public void update(MunicipioDTO dto){
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
    
    public void delete(MunicipioDTO dto){
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
    
    public MunicipioDTO read(MunicipioDTO dto){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        
        try{
            transaction.begin();
            dto.setEntidad(session.get(dto.getEntidad().getClass(), dto.getEntidad().getIdmunicipio()));
            transaction.commit();
        }catch(HibernateException he){
            if(transaction != null && transaction.isActive()){
                transaction.rollback();
            }
        }
        return dto;
    }
    
    public List<MunicipioDTO> readAll(){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        transaction.begin();
        List<MunicipioDTO> lista;
        Query query = session.createQuery("from Municipio h order by h.idmunicipio");
        lista = query.list();
        transaction.commit();
        return lista;       
    }
    public List<Municipio> readEstado(MunicipioDTO dto){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        transaction.begin();
        List<Municipio> lista;
        Query query = session.createSQLQuery("Select * from Municipio h where h.idestado=:u").addEntity(dto.getEntidad().getClass())
                .setParameter("u", dto.getEntidad().getIdestado());
        lista = query.list();
        transaction.commit();
        return lista;       
    } 
    public static void main(String[] args) {
        MunicipioDTO dto=new MunicipioDTO();
        dto.getEntidad().setIdestado(1);
        MunicipioDAO dao=new MunicipioDAO();
        System.out.println(dao.readEstado(dto));
    }
}
