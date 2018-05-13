<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/estilonuevo.css" rel="stylesheet"/>
    </head>
    <body>
        
        <%
            HashMap<String, String> login = new HashMap();
            login.put("admin", "admin");
            login.put("usuario", "usuario");
            login.put("root", "root");
            
            String nombre = request.getParameter("u");
            String contraseña = request.getParameter("p");
            if (login.containsKey(nombre)) {
                if (login.get(nombre).equals(contraseña)) {
                    session.setAttribute("nombre", nombre);
                    response.sendRedirect("inicio.jsp");
                } else {
                    out.println("<div class='alert alert-success' role='alert'>Contraseña incorrecta</div>");
                    out.println("<a href='index.jsp' class='btn btn-primary'><span class='glyphicon glyphicon-home'></span> Volver </button></a>");
                }
            } else {
                out.println("<div class='alert alert-success' role='alert'>El usuario no existe</div>");
                out.println("<a href='index.jsp' class='btn btn-primary'><span class='glyphicon glyphicon-home'></span> Volver </button></a>");
            }
        %> 
    </body>
</html>