/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.modelo.dao;

import com.ipn.mx.modelo.dto.CausaHospDTO;
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
public class CausaHospDAO {

    public void create(CausaHospDTO dto) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();

        try {
            transaction.begin();
            session.save(dto.getEntidad());
            transaction.commit();
        } catch (HibernateException he) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    public void update(CausaHospDTO dto) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();

        try {
            transaction.begin();
            session.update(dto.getEntidad());
            transaction.commit();
        } catch (HibernateException he) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    public void delete(CausaHospDTO dto) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();

        try {
            transaction.begin();
            session.delete(dto.getEntidad());
            transaction.commit();
        } catch (HibernateException he) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    public CausaHospDTO read(CausaHospDTO dto) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();

        try {
            transaction.begin();
            dto.setEntidad(session.get(dto.getEntidad().getClass(), dto.getEntidad().getIdCausaHosp()));
            transaction.commit();
        } catch (HibernateException he) {
            if (transaction != null && transaction.isActive()) {
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

    public List<CausaHospDTO> readAll() {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        Transaction transaction = session.getTransaction();
        List<CausaHospDTO> lista = null;
        try {
            transaction.begin();    
            Query query = session.createQuery("from CausaHosp c order by c.idCausaHosp");
            lista = query.list();
            transaction.commit();
        }
        catch (HibernateException he) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
        }finally {
            if (session != null) {
                session.close();
            }
        }
        return lista;
    }
}
