<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
    


<table style="width:100%" class="table table-striped">
	<tr>
		<th>Id</th>
		<th>Name</th>
		<th>Price</th>
		<th>Quantity</th>
		<th>Amount</th>
		<th>action</th>
		
	</tr>
<c:forEach var="item" items="${cart.items}">
<form action="/cart/update/${item.id}" method="post">
	<input type="hidden" name="id" value="${item.id}">
	<tr>
		<td>${item.id}</td>
		<td>${item.name}</td>
		<td>${item.price}</td>
		<td><input name="qty" value="${item.qty}" 
				onblur="this.form.submit()" style="width:50px;"></td>
		<td>${item.price * item.qty}</td>
		
		<td>
			<button type="button" class="btn btn-warning">update</button>
	<a href="/cart/remove/${item.id}"><button type="button" class="btn btn-danger">Remove</button>
</a>
		</td>
		
		
	</tr>
</form>
</c:forEach>
</table>

<a href="/cart/clear"><button type="button" class="btn btn-primary">Clear Cart</button>
</a>
<!--lab4 <a href="/item/index">Add more</a> -->
<a href="/"><button type="button" class="btn btn-success">Add more</button>
</a>

<a href="/cart/checkout" class="pull-right"><button type="button" class="btn btn-primary">Check out</button>
</a>







   