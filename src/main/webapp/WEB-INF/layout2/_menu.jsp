<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand text-center" href="${pageContext.request.contextPath}/admin/index">Admin</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">

                    <li>
                        <a href="${pageContext.request.contextPath}/category/index">Category</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/product/page">Product</a>
                    </li>
                     <li>
                        <a href="${pageContext.request.contextPath}/report/inventory-by-category">Report</a>
                    </li>
                       <li>
                        <a href="${pageContext.request.contextPath}/">Log off</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        