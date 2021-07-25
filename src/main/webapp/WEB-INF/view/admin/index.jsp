 <%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
 <div class="row test">
						<table class="table">
						  <thead class="thead-dark">
						    <tr>
						      <th scope="col">Account</th>
						      <th scope="col">Email</th>
						      <th scope="col">Status</th>
						      <th scope="col">Role</th>
						      <th scope="col">Name</th>
						      <th></th>
						    </tr>
						  </thead>
						  <tbody>
							  <c:forEach var="item" items="${items}">
							    <tr>							   
							      <td>${item.username }</td>
							      <td>${item.email }</td>
							      <td>${item.activated==true?'Active':'Unactive' }</td>
							      <td>${item.admin==true?'Admin':'User' }</td>
							      <td>${item.fullname }</td>
							      <td><a href="/account/edit/${item.username}">Edit</a></td>
							    </tr>
							  </c:forEach> 
						  </tbody>
						</table>
                    </div>

                    <h4 class="mt-5">THÔNG TIN TÀI KHOẢN</h4>
                    <div class="row">

                        <!-- Content Column -->
                        <div class="col-lg-8 mb-4">
							<form:form action="/admin/index" modelAttribute="item">							
								<div>
									<div class="form-group row">
									    <label for="inputEmail3" class="col-sm-2 col-form-label">Username</label>
									    <div class="col-sm-10">									    
									      <form:input type="text" path="username" class="form-control"/>
									    </div>
									 </div>
                                     <div class="form-group row">
									    <label for="inputEmail3" class="col-sm-2 col-form-label">Password</label>
									    <div class="col-sm-10">									    
									      <form:input type="password" path="password" class="form-control disabled"/>
									    </div>
									 </div>
									<div class="form-group row">
									    <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
									    <div class="col-sm-10">									    
									      <form:input type="text" path="email" class="form-control"/>
									    </div>
									 </div>
                                     <div class="form-group row">
                                         <label for="my-input" class="col-sm-2 col-form-label">Status</label>
                                         <div class="col-sm-10">                                             
                                         <form:radiobuttons items="${activates}" path="activated" cssClass="form-control-input ml-2" name=""/>
                                         </div>
                                     </div>
                                     <div class="form-group row">
                                        <label for="my-input" class="col-sm-2 col-form-label">Role</label>
                                        <div class="col-sm-10">                                             
                                        <form:radiobuttons items="${admins}" path="admin" cssClass="form-control-input ml-2" name=""/>
                                        </div>
                                    </div>
									  <div class="form-group row">
									    <label for="inputPassword3" class="col-sm-2 col-form-label">Name</label>
									    <div class="col-sm-10">
									      <form:input type="text" path="fullname" class="form-control"/>
									    </div>
									  </div>
								
									  <div class="form-group row">
									    <div class="col row">
									      <button class="btn btn-success ml-1" formaction="/account/update"><i class="fas fa-edit"></i> Update</button>
									      <a class="btn btn-danger ml-auto" href="/account/delete/${item.username }"><i class="fas fa-trash-alt"></i>Delete</a>
									      <a class="btn btn-light ml-1" href="/Admin/index/account"><i class="fas fa-redo-alt"></i> Reset</a>
									    </div>
									  </div>
								</div>								
							</form:form>
                        </div>