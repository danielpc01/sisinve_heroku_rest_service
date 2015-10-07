package com.inventario.repositorio.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inventario.persistencia.Producto;
import com.inventario.repositorio.ProductoRepositorio;

@Repository
public class ProductoRepositorioImpl implements ProductoRepositorio{
	
	
	@Autowired
	private SessionFactory sessionfactory;


	public Producto saveProducto(Producto producto) {
		Session session=sessionfactory.openSession();
		Transaction transaction=session.beginTransaction();
		//producto.setId(obtenerSecuencialProducto().intValue());
		session.saveOrUpdate(producto);
		transaction.commit();
		session.close();
		return producto;
	}


	@SuppressWarnings("unchecked")
	public List<Producto> getProductos() {
		String query="from Producto t ";
		Session session=sessionfactory.openSession();
		Query objQuery=session.createQuery(query);
		
		List<Producto> listaProductos=objQuery.list();
		session.close();
		return listaProductos;
	}


	@SuppressWarnings("unchecked")
	public List<Producto> getProductos(int idArea) {
		String query="from Producto t where t.area.id = :idArea ";
		Session session=sessionfactory.openSession();
		Query objQuery=session.createQuery(query);
		objQuery.setInteger("idArea", idArea);
		List<Producto> listaProductos=objQuery.list();
		session.close();
		return listaProductos;
	}
	
	@SuppressWarnings("unchecked")
	public Producto getProducto(int idProd) {
		String query="from Producto t where t.id = :idProd ";
		Session session=sessionfactory.openSession();
		Query objQuery=session.createQuery(query);
		objQuery.setInteger("idProd", idProd);
		List<Producto> listaProductos=objQuery.list();
		session.close();
		return listaProductos.size()>0?listaProductos.get(0):null;
	}
	/*
	private Long obtenerSecuencialProducto(){
		Long secuencia=null;
		try{
			StringBuffer strQuery = new StringBuffer();
			strQuery.append(" SELECT NEXTVAL('seq_producto'); ");
			Session session=sessionfactory.openSession();
			Query query = session.createSQLQuery(strQuery.toString());
			List lista = query.list();
			Object seqEmpleado =lista.get(0);
			if(seqEmpleado==null){
				secuencia=new Long(1);
			}else{
				secuencia = new Long(seqEmpleado.toString());
			}			
			session.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return secuencia;
	}*/
}
