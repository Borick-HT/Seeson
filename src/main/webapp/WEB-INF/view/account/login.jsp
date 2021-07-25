<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

 <div class="row">
	<div class="">
<h3>LOGIN</h3>
<form action="/account/login1" method="post">
   <div class="row">
                <div class="col-md-6 login-form-1">
	 <div class="form-group">
      <label for="username">Username:</label>
      <input type="text" class="form-control"  placeholder="Enter username" name="username">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control"  placeholder="Enter password" name="password">
    </div>
   
    <button  class="btn btn-primary">login</button>
	</div>
	</div>
</form>
</div>
</div>