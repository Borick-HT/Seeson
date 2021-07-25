<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="container tm-mt-big tm-mb-big">
	<div class="row">
		<div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
			<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
				<div class="row">
					<div class="col-12">
						<h2 class="tm-block-title d-inline-block">Add Category</h2>
					</div>
				</div>
				<div class="row tm-edit-product-row">
					<div class="col-xl-12 col-lg-12 col-md-12">
						<form:form action="/category/index" modelAttribute="item"
							class="tm-edit-product-form">
							<div class="row">
								<div class="form-group mb-3 col-6">
									<label for="name">Id </label>
									<form:input path="id" class="form-control validate" />
								</div>
								<div class="form-group mb-3 col-6">
									<label for="name">Name </label>
									<form:input path="name" class="form-control validate" />
								</div>
							</div>
							<div class="row">
								<div class="form-group mb-3 col-3">
									<button type="submit" formaction="/category/create"
										class="btn btn-primary btn-block ">Add
										Category</button>
								</div>
								<div class="form-group mb-3 col-3">
									<button type="submit" formaction="/category/update"
										class="btn btn-primary btn-block  ">Update
										Category</button>
								</div>
								<div class="form-group mb-3 col-3">
									<button type="submit" formaction="/category/delete/${item.id}"
										class="btn btn-primary btn-block ">Delete
										Category</button>
								</div>
								<div class="form-group mb-3 col-3">
									<button type="submit" formaction="/category/index"
										class="btn btn-primary btn-block ">Reset
										Category</button>
								</div>
							</div>
						</form:form>

					</div>

				</div>
			</div>
		</div>
	</div>
</div>