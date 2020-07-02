<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product"%>

<%@ include file ="../database/dbconn.jsp" %>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		
		if(id == null || id.trim().equals("")){
			response.sendRedirect("../product/products.jsp?id="+id);
			return;
		}
		
		ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");
		
		
		if(list == null){
			list = new ArrayList<Product>();
			session.setAttribute("cartlist", list);
		}
		int cnt =0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Product goodsQnt = new Product();
		
		for (int i=0; i <list.size(); i++) {
			goodsQnt = list.get(i);

			if(goodsQnt.getProductId().equals(id)){
				cnt++;
				int orderQuantity = goodsQnt.getQuantity() + 1;
				goodsQnt.setQuantity(orderQuantity);
			}
		}
		
		if(cnt == 0){
			try{
				Product goods = new Product();
				String sql = "select * from product where pId=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					goods.setProductId(rs.getString("pId"));
					goods.setPname(rs.getString("pName"));
					goods.setUnitPrice(rs.getInt("pUnitPrice"));
					goods.setCategory(rs.getString("pCategory"));
					goods.setColor(rs.getString("pColor"));
					goods.setSize(rs.getString("pSize"));
					goods.setQuantity(1);
					
					list.add(goods);
				}
			}catch(SQLException e){
				out.println("SQLException: "+e.getMessage());
			}finally{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
		}
		
		
		
		response.sendRedirect("../order/order.jsp");
		
		
	%>
</body>
</html>