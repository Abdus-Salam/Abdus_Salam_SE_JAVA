<jsp:include page="header.jsp"></jsp:include>

<%! String name  = ""; %>
<%! String price  = ""; %>
<%! String profit  = ""; %>
<%! String type  = ""; %>



<div class="container-fluid">
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
			
		  <form action="product" name="productAddForm" method = "POST">
				<div class="panel panel-primary">
					<div class="panel-heading"> Sell new product </div>
					<div class="panel-body">
						<div class="row">
                          <div class="col-sm-6 col-sm-offset-6">
                                <div class="form-group">
                                  <label> Product name <span class="requiredSign"> * </span> </label>
                                 <input type="text" value='<%= name %>' name="name" class="form-control" id="name" placeholder="Enter a product name" required>
                                </div>

                                 <div class="form-group">
                                  <label> Price <span class="requiredSign"> * </span> </label>
                                 <input type="number" value="<%= price %>" name="price"  pattern="\d*" class="form-control" id="price" placeholder="Enter an amount" required>
                                </div>
                                
                                
								<%-- 
								<div class="form-group">
								  <label> Profitable amount <span class="requiredSign"> * </span> </label>
								 <input type="number" value="<%= profit %>" name="profit" pattern="\d*" class="form-control" id="profitAmount" placeholder="Enter an amount" required>
								</div>
								--%>
                                
                                
                                <div class="form-group">
                                     <label for="profit"> Profitable amount <span class="requiredSign"> * </span> </label>
                                       <div class="input-group">
                                       <input type="number" name="profit" value="" id="profit" class="form-control" placeholder="Enter an amount" required>
                                         <span class="input-group-addon">%</span>
                                     </div>
                                 </div>
                                        
                                        

                                 <div class="form-group">
                                  <label> Product type <span class="requiredSign"> * </span> </label>
                                 	<select id="type" name="type" class="form-control" required>
                                 	    <option value=""> Please select a type </option>
									   <option value="1"> Ram </option>
									   <option value="2"> Motherboard </option>
									   <option value="3"> Graphics Card </option>
								</select>
                                </div>
                                
                                <button type="submit" class="btn btn-primary pull-right"> Submit </button>

                              </div>
                           </div>
					</div> <!-- ./ panel body -->
				</div>
			</form>
		</div>
	</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>