<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="container mt-5">
	<div class="row tm-content-row">
		<div
			class="col-sm-12 col-md-12 col-lg-10 col-xl-10 tm-block-col m-auto">
			<div class="tm-bg-primary-dark tm-block tm-block-products">
				<div class="tm-product-table-container">
					<table class="table table-hover tm-table-small tm-product-table">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">NAME</th>
								<th scope="col">&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							<tr>

								<c:forEach var="item" items="${items}">
									<tr>
										<td>${item.id}</td>
										<td>${item.name}</td>
										<td class="text-center"><a
											href="/category/edit/${item.id}"
											class="tm-product-delete-link"> <i
												class="far fa-trash-alt tm-product-delete-icon">edit</i>
										</a></td>
									</tr>
								</c:forEach>
							</tr>

						</tbody>
					</table>
				</div>

				<!-- table container -->
				<a href="/category/add"
					class="btn btn-primary btn-block text-uppercase mb-3">Add new
					category</a>
			</div>
		</div>

	</div>
</div>