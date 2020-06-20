                     /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.dao;

import com.ipn.mx.modelo.dto.DataGraphEstadoCuartoDTO;
import com.ipn.mx.modelo.entidades.DataGraphEstadoCuarto;
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
public class DataGraphEstadoCuartoDAO {
    public List read(){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        List<DataGraphEstadoCuartoDTO> lista = null;
        try{
            transaction.begin();
            Query query = session.createSQLQuery("Select * from Grafica ").addEntity(DataGraphEstadoCuarto.class);
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
        DataGraphEstadoCuartoDAO dao=new DataGraphEstadoCuartoDAO();
        System.out.println(dao.read());
    }
    
}
