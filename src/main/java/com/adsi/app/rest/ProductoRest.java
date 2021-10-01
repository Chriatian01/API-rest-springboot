/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
        package com.adsi.app.rest;

        import com.adsi.app.controlador.Controlador;
        import com.adsi.app.modelo.Producto;
        import java.io.IOException;
        import java.sql.SQLException;
        import java.util.List;
        import javax.ws.rs.GET;
        import javax.ws.rs.Path;
        import javax.ws.rs.PathParam;
        import javax.ws.rs.Produces;
        import javax.ws.rs.core.MediaType;

/**
 *
 * @author jhant
 */

        @Path("/rest")
        public class ProductoRest {

            private final Controlador repo = new Controlador ();

        public ProductoRest() throws SQLException,  IOException{
            repo.conectar();
        }



        @GET
        @Produces({MediaType.APPLICATION_JSON})
        @Path("/get")
        public String get(){
        return "Hola Rest GET";
        }

        @GET
        @Produces({MediaType.APPLICATION_JSON})
        @Path("/productos/list")
        public List<Producto> productList() throws SQLException{
        return repo.findAllProductos();
        }

       
        @GET
        @Produces({MediaType.APPLICATION_JSON})
        @Path("/productos/escasos/(cantidad)")
        public List<Producto> listarProductosEscasos(@PathParam("cantidad") Integer cantidad) throws SQLException {
        return repo.listarProductosEscasos(cantidad);
        }

        @GET
        @Produces({MediaType.APPLICATION_JSON})
        @Path("/proveedores/list")
        public List<Proveedores> findAllProveedores() throws SQLException{
        return repo.findAllProveedores();
        }

        }