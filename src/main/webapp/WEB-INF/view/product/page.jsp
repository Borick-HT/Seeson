<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<h3>PAGINATION</h3>
		                
<a href="/admin/product/create" class="btn btn-sm btn-primary btn-sm" data-title="add"><i class="fa fa-plus"></i> Thêm mới</a>

<table style="width: 100%" class="table table-striped">
	<tr>
		<th>&nbsp;</th>
		<th>Id</th>
		<th>Name</th>
		<th>Price</th>
		<th>Date</th>
	</tr>
	<c:forEach var="item" items="${page.content}">
		<tr>
			<td><a
				href="/product/edit/${item.id}"> Edit</a></td>
			<td>${item.id}</td>
			<td>${item.name}</td>
			<td>${item.price}</td>
			<td>${item.createDate}</td>
		</tr>
	</c:forEach>
</table>

<a href="/product/page?p=0"><button type="button"
		class="btn btn-primary">First</button> </a>
<a href="/product/page?p=${page.number-1}">
	<button type="button" class="btn btn-secondary">Previous</button>
</a>
<a href="/product/page?p=${page.number+1}"><button type="button"
		class="btn btn-success">Next</button> </a>
<a href="/product/page?p=${page.totalPages-1}"><button type="button"
		class="btn btn-danger">Last</button> </a>
<ul>
	<li>Present entities: ${page.numberOfElements}</li>
	<li>Page: ${page.number}</li>
	<li>Size page: ${page.size}</li>
	<li>Total entities: ${page.totalElements}</li>
	<li>Total pages: ${page.totalPages}</li>
</ul>
