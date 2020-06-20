/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ipn.mx.web.bean;

import com.ipn.mx.modelo.dao.DataGraphHospitalizacionDAO;
import com.ipn.mx.modelo.entidades.DataGraphHospitalizacion;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.inject.Named;
import javax.enterprise.context.Dependent;
import org.primefaces.model.chart.Axis;
import org.primefaces.model.chart.AxisType;
import org.primefaces.model.chart.BarChartModel;
import org.primefaces.model.chart.ChartSeries;

/**
 *
 * @author yirz
 */
@Named(value = "graficaHosp")
@Dependent
public class GraficaHosp {
    private DataGraphHospitalizacionDAO dao = new DataGraphHospitalizacionDAO();
    private List<DataGraphHospitalizacion> listaData;
    private BarChartModel model;
    /**
     * Creates a new instance of GraficaEdoCuarto
     */
    public GraficaHosp() {
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
            DataGraphHospitalizacion entidad = (DataGraphHospitalizacion) listaData.get(i);
            estado.setLabel(entidad.getTratamiento());
            estado.set("Cuartos",entidad.getTotal());
            model.addSeries(estado);
            if(total<entidad.getTotal())
                total=entidad.getTotal();
        }
        model.setTitle("Grafica Razones Hospitalarias");
        model.setLegendPosition("ne");
 
        Axis xAxis = model.getAxis(AxisType.X);
        xAxis.setLabel("Razones Hospitalarias");
 
        Axis yAxis =    model.getAxis(AxisType.Y);
        yAxis.setLabel("Cantidad");
        yAxis.setMin(0);
        yAxis.setMax(total+5);
        
    }

    public DataGraphHospitalizacionDAO getDao() {
        return dao;
    }

    public void setDao(DataGraphHospitalizacionDAO dao) {
        this.dao = dao;
    }

    public List<DataGraphHospitalizacion> getListaData() {
        return listaData;
    }

    public void setListaData(List<DataGraphHospitalizacion> listaData) {
        this.listaData = listaData;
    }

    public BarChartModel getModel() {
        return model;
    }

    public void setModel(BarChartModel model) {
        this.model = model;
    }
    

    
}
