/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.web.bean;

import com.ipn.mx.modelo.dao.DataGraphEstadoCuartoDAO;
import com.ipn.mx.modelo.entidades.DataGraphEstadoCuarto;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import org.primefaces.model.chart.Axis;
import org.primefaces.model.chart.AxisType;
import org.primefaces.model.chart.BarChartModel;
import org.primefaces.model.chart.ChartSeries;

/**
 *
 * @author yirz
 */
@Named(value = "graficaEdoCuarto")
@SessionScoped
public class GraficaEdoCuarto implements Serializable{
    private DataGraphEstadoCuartoDAO dao = new DataGraphEstadoCuartoDAO();
    private List<DataGraphEstadoCuarto> listaData;
    private BarChartModel model;
    /**
     * Creates a new instance of GraficaEdoCuarto
     */
    public GraficaEdoCuarto() {
    }
    @PostConstruct
    public void init(){
        listaData=new ArrayList<>();
        listaData=dao.read();
        createPieGraph();
    }
    public void createPieGraph(){
        int total=0;
        model=new BarChartModel();
        for(int i=0;i<listaData.size();i++){
            ChartSeries estado  = new ChartSeries();
            DataGraphEstadoCuarto entidad = (DataGraphEstadoCuarto) listaData.get(i);
            estado.setLabel(entidad.getEdocuarto());
            estado.set("Cuartos",entidad.getTotal());
            model.addSeries(estado);
            if(total<entidad.getTotal())
                total=entidad.getTotal();
        }
        model.setTitle("Grafica de los Estados de los cuartos");
        model.setLegendPosition("ne");
 
        Axis xAxis = model.getAxis(AxisType.X);
        xAxis.setLabel("Estados");
 
        Axis yAxis =    model.getAxis(AxisType.Y);
        yAxis.setLabel("Cantidad de Cuartos");
        yAxis.setMin(0);
        yAxis.setMax(total+5);
        
    }

    public DataGraphEstadoCuartoDAO getDao() {
        return dao;
    }

    public void setDao(DataGraphEstadoCuartoDAO dao) {
        this.dao = dao;
    }

    public List<DataGraphEstadoCuarto> getListaData() {
        return listaData;
    }

    public void setListaData(List<DataGraphEstadoCuarto> listaData) {
        this.listaData = listaData;
    }

    public BarChartModel getModel() {
        return model;
    }

    public void setModel(BarChartModel model) {
        this.model = model;
    }

   

    
    
}
