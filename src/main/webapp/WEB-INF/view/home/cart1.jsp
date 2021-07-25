<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<div class="row carousel-holder">

	<div class="col-md-12">
		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img class="slide-image"
						src="https://cdn.shopify.com/s/files/1/0448/3081/8454/files/Banner-website_1400x.jpg?v=1619443160 "
						alt="">
				</div>
				<div class="item">
					<img class="slide-image" src="http://placehold.it/800x300" alt="">
				</div>
				<div class="item">
					<img class="slide-image" src="http://placehold.it/800x300" alt="">
				</div>
			</div>

		</div>
	</div>

</div>

<div class="row">
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



</div>