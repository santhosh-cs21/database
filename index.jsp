<%@ page import="java.sql.*" %>
<%  Class.forName("org.mariadb.jdbc.Driver"); %>
<HTML>
       <HEAD>
       <TITLE>The View Of Database Table </TITLE>
       </HEAD>
       <BODY>
       <H1>The View Of Database Table </H1>
       <%
           Connection connection = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3310/skfp", "root", "root");
           Statement statement = connection.createStatement() ;
          ResultSet resultset = statement.executeQuery("select shop_name,package_type,supply_date from supply_master s,shop_master sm,package_master pm where s.shop_id=sm.shop_id and s.package_id=pm.package_id order by s.batch_id ") ;
       %>
      <TABLE BORDER="1">
      <TR>
      <th>Shop Name</th>
      <th>Package Type</th>
      <th>Supply Date</th>
      </TR>
      <% while(resultset.next()){ %>
      <TR>
       <TD> <%= resultset.getString(1) %></td>
       <TD> <%= resultset.getString(2) %></td>
       <TD> <%= resultset.getString(3) %></td>
      </TR>
      <% } %>
     </TABLE>
     </BODY>
</HTML>
