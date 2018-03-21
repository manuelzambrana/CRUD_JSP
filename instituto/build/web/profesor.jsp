<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./estilo.css" type="text/css"><link>
    <title>Instituto Zambrana </title>
  </head>

  <body>
      <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="inicio.jsp">IES Zambrana</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="alumno.jsp">añade alumno</a></li>
      <li class="active" style="margin-left: 20px"><a href="profesor.jsp">añade profesor</a></li>
       <li class="active" style="padding-left:1000px;"><a href="index.jsp">Salir</a></li>
     
    </ul>
  </div>
</nav>

</div>
        <%
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/instituto","root","");
          Statement s = conexion.createStatement();

          ResultSet listado = s.executeQuery ("SELECT * FROM profesor");
        %>
        
        <table class="table table-hover">
        <tr><th>profesor_id</th><th>Nombre</th><th>Edad</th><th>Nombre de Asignatura Impartida</th></tr>
        <form method="get" action="grabaProfesor.jsp">
          <tr><td><input type="text" name="profesor_id" size="5"></td>
              <td><input type="text" name="nombre" size="30"></td>            
              <td><input type="text" name="edad" size="5"></td>
              <td><input type="text" name="asignatura" size="20"></td>
              <td><button type="submit" value="Añadir" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span></button></td><td></td></tr>           
        </form>
        <%
          while (listado.next()) {
            out.println("<tr><td>");
            out.println(listado.getString("profesor_id") + "</td>");
            out.println("<td>" + listado.getString("nombre") + "</td>");            
            out.println("<td>" + listado.getString("edad") + "</td>");
            out.println("<td>" + listado.getString("asignatura") + "</td>");
        %>
        <td>
        <form method="get" action="modificaProfesor.jsp">
	<input type="hidden" name="profesor_id" value="<%=listado.getString("profesor_id") %>">
          <input type="hidden" name="nombre" value="<%=listado.getString("nombre") %>">         
          <input type="hidden" name="edad" value="<%=listado.getString("edad") %>">
          <input type="hidden" name="asignatura" value="<%=listado.getString("asignatura") %>">
	<button type="submit"  class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span> Modificar</button>
				</form>
				</td>
	<td>
        <form method="get" action="borraProfesor.jsp">
          <input type="hidden" name="profesor_id" value="<%=listado.getString("profesor_id") %>"/>
          <button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Eliminar</button>
        </form>
        </td></tr>
        <%
          } // while   

          conexion.close();
        %>

        </table>
      </div>
      
      <div class="text-center">&copy; Manuel Zambrana Jiménez</div>
      
    </div>
    
    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>