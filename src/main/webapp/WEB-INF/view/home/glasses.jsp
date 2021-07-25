<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="row">
	<c:forEach var="item" items="${page.content}">
		<div class="col-sm-4 col-lg-4 col-md-4">
			<div class="thumbnail">
				<img src="<c:url value="${item.image}"/>">
				<div class="caption">
					<h5>
						<a href="#">${item.name}</a>

					</h5>
					<h4>${item.price}VND</h4> <a href="/cart/add/${item.id}"><button type="button" class="btn btn-info pull-right">Add To Cart</button>
					
						
				</div>

			</div>
		</div>
	</c:forEach>



</div>