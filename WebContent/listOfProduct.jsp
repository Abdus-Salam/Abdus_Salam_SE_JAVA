<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<jsp:include page="header.jsp"></jsp:include>
	
<%-- 
	<%= request.getAttribute("listOfProducts") %>
--%> 

	<div class="containter-fluid">
		<div class="row">
			<div class="col-sm-12">
			
			<div style="color: red; margin-bottom: 15px">
				<% if(request.getAttribute("error") != null){ %>
					<%= request.getAttribute("error") %>
				<% } %>
			</div>
			
			<div style="color: green; margin-bottom: 15px">
				<% if(request.getAttribute("success") != null){ %>
					<%= request.getAttribute("success") %>
				<% } %>
			</div>
			
			
				<table id='productListGrid' class='table table-bordered table-hover text-center' width="80%" style="width: 70%; margin: 0 auto">
                        <thead>
                            <tr style="background-color: #ddd">
                                <th class="text-center" width="5%">#</th>
                                <th class="text-center" width="17%">Product name</th>
                                <th class="text-center" width="17%">Price</th>
                                <th class="text-center" width="17%">Profit</th>
                                <th class="text-center" width="17%">Type</th>
                                <th class="text-center" width="10%">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
				
					 <%  
						ArrayList<Product> list = (ArrayList<Product>) request.getAttribute("listOfProducts");
						int i = 1;
						for(Product product : list) { %>
							<% if (i%2 == 0){ %>
							<tr style="background-color: #abc">
							<% }else{ %>
								<tr style="background-color: #fff">
							<% } %>
							    <td> <%= i++ %></td>
							    <td> <%= product.getName() %></td>
							    <td> <%= product.getPrice() %></td>
							    <td> <%= product.getProfit() %></td>
							    <% if(product.getType() == 1){ %>
							    	<td> Ram </td>
							    <% }else{
							    	if(product.getType() == 2){ %>
							    		<td> Motherboard </td>
								    <% }else{
								    		if(product.getType() == 3){ %>
								    			<td> Graphics Card </td>
								    		<% } %>
								    	<% } %>
								    <% } %>
									<td>
									  <div class="text-center">
									     <div class="btn-group">
									       <%--   <a href="product?update=<%= product.getId() %>" title="Edit" class="btn btn-xs btn-warning">Edit</a> --%>
									         <a href="product?delete=<%= product.getId() %>" title="Delete" class="btn btn-xs btn-danger">Delete</a>
									     </div>
									  </div>
									</td>
						    </tr>
						<% } %>
					                    	
					                       
					    </tbody>
                    </table> 
			</div>
		</div>
	</div>
<jsp:include page="footer.jsp"></jsp:include>