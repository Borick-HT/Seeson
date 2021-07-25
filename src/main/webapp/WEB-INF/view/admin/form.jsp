<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


	<!-- Content Column -->
	<div class="col-lg-8 mb-4">
		<form:form action="/admin/product/create" modelAttribute="item" enctype="multipart/form-data">
			<div>
				
				<div class="form-group row">
					<label for="inputEmail3" class="col-sm-2 col-form-label">
						Name</label>
					<div class="col-sm-10">
						<form:input type="text" path="name" class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label for="inputPassword3" class="col-sm-2 col-form-label">Price
						</label>
					<div class="col-sm-10">
						<form:input type="number" path="price" class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label for="inputPassword3" class="col-sm-2 col-form-label">Date
						</label>
					<div class="col-sm-10">
						<form:input type="date" path="createDate" class="form-control"
							id="inputPassword3" />
					</div>
				</div>
				<div class="form-group row">
					<label for="inputPassword3" class="col-sm-2 col-form-label">Category
						</label>
					<div class="col-sm-10">
						<form:input type="text" path="category.id" class="form-control" />
					</div>
				</div>
				<div class="form-group row">
					<label for="inputPassword3" class="col-sm-2 col-form-label">
						Status:<br>True:available<br>False:unavailable
					</label>
					<div class="col-sm-10">
						<form:input type="text" path="available" class="form-control"
							placeholder="true : false" />
					</div>
				</div>
				
				
				<div class="form-group row">
					<div class="col row">
						<button class="btn btn-primary ml-3" formaction="/product/create">
							<i class="fas fa-location-arrow"></i>Create
						</button>
						<button class="btn btn-success ml-1" formaction="/product/update">
							<i class="fas fa-edit"></i> Update
						</button>
						<a class="btn btn-danger ml-auto"
							href="/product/delete/${item.id }"><i
							class="fas fa-trash-alt"></i> Delete</a> <a class="btn btn-light ml-1"
							href="/product/page"><i class="fas fa-redo-alt"></i> Reset</a>
						
							
					</div>
				</div>
			</div>
		</form:form>
	</div>


