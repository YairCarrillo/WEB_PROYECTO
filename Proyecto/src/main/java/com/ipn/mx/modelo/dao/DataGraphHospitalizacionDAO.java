/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.dao;

import com.ipn.mx.modelo.dto.DataGraphHospitalizacionDTO;
import com.ipn.mx.modelo.entidades.DataGraphHospitalizacion;
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
public class DataGraphHospitalizacionDAO {
     public List read(){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        List<DataGraphHospitalizacionDTO> lista = null;
        try{
            transaction.begin();
            Query query = session.createSQLQuery("Select * from Graficahosp ").addEntity(DataGraphHospitalizacion.class);
            lista = query.list();
            transaction.commit();
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
        
        return lista;
    }
    public static void main(String[] args) {
        DataGraphHospitalizacionDAO dao=new DataGraphHospitalizacionDAO();
        System.out.println(dao.read());
    }
}
