/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.dao;

import com.ipn.mx.modelo.dto.MedicoDTO;
import com.ipn.mx.util.HibernateUtil;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author yirz
 */
public class MedicoDAO {
    public Connection con;
    
    public Connection getConnection() throws SQLException{
        String user = "ntkbequsmrwokb";
        String pwd = "bdfb3ebe920f1cac9d88f2ff19b261059014dd77ec5237f28eb84b14ac3706fd";
        String url = "jdbc:postgresql://ec2-52-44-55-63.compute-1.amazonaws.com:5432/denmvmarmuuvcu?sslmode=require";
        String driver = "org.postgresql.Driver";
        
        try{
            Class.forName(driver);
            con = DriverManager.getConnection(url, user, pwd);
        }catch(ClassNotFoundException | SQLException ex){
            System.out.println("Error en la conexion");
        }
        
        return con;
    }
    
    public void create(MedicoDTO dto){
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
    
    public void update(MedicoDTO dto){
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
    
    public void delete(MedicoDTO dto){
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
    
    public MedicoDTO read(MedicoDTO dto){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        
        try{
            transaction.begin();
            dto.setEntidad(session.get(dto.getEntidad().getClass(), dto.getEntidad().getCedula()));
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
    
    public List<MedicoDTO> readAll(){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        transaction.begin();
        List<MedicoDTO> lista;
        Query query = session.createQuery("from Medico h order by h.cedula");
        lista = query.list();
        transaction.commit();
        session.close();
        return lista;       
    }
    public static void main(String[] args) {
        //MunicipioDTO dto=new MunicipioDTO();
        //dto.getEntidad().setIdestado(1);
        MedicoDAO dao=new MedicoDAO();
        System.out.println(dao.readAll());
    }
}
