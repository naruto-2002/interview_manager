<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="/img/logo-fav.png">
    <title>Beagle</title>
    <link rel="stylesheet" type="text/css" href="/lib/perfect-scrollbar/css/perfect-scrollbar.css">
    <link rel="stylesheet" type="text/css"
          href="/lib/material-design-icons/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" type="text/css"
          href="/lib/datatables/datatables.net-bs4/css/dataTables.bootstrap4.css">
    <link rel="stylesheet" type="text/css"
          href="/lib/datatables/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="/css/app.css" type="text/css">
</head>

<body>

<%@include file="../lay_out/header.jsp"%>
<%@include file="../lay_out/left-sidebar.jsp"%>

<div class="be-content">
    <div class="page-head">
        <h2 class="page-head-title">Data Tables</h2>
        <nav aria-label="breadcrumb" role="navigation">
            <ol class="breadcrumb page-head-nav">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item"><a href="#">User</a></li>
                <li class="breadcrumb-item active">Create User</li>
            </ol>
        </nav>
    </div>

    <div class="container">
        <h1>User Registration</h1>
        <%--@elvariable id="newUser" type=""--%>
        <form:form action="/user/create" method="post" modelAttribute="newUser">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="fullName">Full Name:</label>
                        <form:input type="text" class="form-control" id="fullName" path="fullName" placeholder="Enter your full name" />
                    </div>
                    <div class="form-group">
                        <label for="userame">Username:</label>
                        <form:input type="text" class="form-control" id="userame" path="username" placeholder="Enter your  username" />
                    </div>
                    <div class="form-group">
                        <label for="dateOfBirth">Date of Birth:</label>
                        <form:input type="date" class="form-control" id="dateOfBirth" path="dob"/>
                    </div>
                    <div class="form-group">
                        <label for="phoneNumber">Phone Number:</label>
                        <form:input type="tel" class="form-control" id="phoneNumber"
                               placeholder="Enter your phone number" path="phoneNumber"/>
                    </div>
                    <div class="form-group">
                        <label for="role">Role:</label>
                        <form:select class="form-control" id="role" path="role.roleName">
                            <form:option value="ADMIN">Admin</form:option>
                            <form:option value="RECUITER">Recruiter</form:option>
                            <form:option value="INTERVIEWER">Interviewer</form:option>
                            <form:option value="MANAGER">Manager</form:option>
                        </form:select>
                    </div>
                    <div class="form-group">
                        <label for="status">Status:</label>
                        <form:select class="form-control" id="status" path="status">
                            <form:option value="ACTIVE">Active</form:option>
                            <form:option value="INACTIVE">Inactive</form:option>
                        </form:select>
                    </div>



                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <form:input type="email" class="form-control" id="email" path="email" />
                    </div>
                    <div class="form-group">
                        <label for="address">Address:</label>
                        <form:input type="text" class="form-control" id="address" path="address"/>
                    </div>
                    <div class="form-group">
                        <label for="gender">Gender:</label>
                        <form:select class="form-control" id="gender" path="gender">
                            <form:option value="MALE">Male</form:option>
                            <form:option value="FEMALE">Female</form:option>
                            <form:option value="OTHER">Other</form:option>
                        </form:select>
                    </div>
                    <div class="form-group">
                        <label for="department">Department:</label>
                        <form:select class="form-control" id="department" path="department">
                            <option value="">Select</option>
                            <form:option value="HR">HR</form:option>
                            <form:option value="ENGINEERING">Engineering</form:option>
                            <form:option value="SALES">Sales</form:option>
                            <form:option value="MARKETING">Marketting</form:option>
                        </form:select>
                    </div>
                    <div class="form-group">
                        <label for="note">Note:</label>
                        <form:input class="form-control" id="note" rows="3" path="note"/>
                    </div>
                </div>
            </div>



            <div class="row">
                <div class="col-md-12">
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="button" class="btn btn-secondary">Cancel</button>
                </div>
            </div>
        </form:form>
    </div>
</div>


</body>
<script src="\lib\jquery\jquery.min.js" type="text/javascript"></script>
<script src="\lib\perfect-scrollbar\js\perfect-scrollbar.min.js" type="text/javascript"></script>
<script src="\lib\bootstrap\dist\js\bootstrap.bundle.min.js" type="text/javascript"></script>
<script src="\js\app.js" type="text/javascript"></script>
<script src="\lib\jquery.sparkline\jquery.sparkline.min.js" type="text/javascript"></script>
<script src="\lib\countup\countUp.min.js" type="text/javascript"></script>
<script src="\lib\jquery-ui\jquery-ui.min.js" type="text/javascript"></script>
<script src="\lib\jqvmap\jquery.vmap.min.js" type="text/javascript"></script>
<script src="\lib\jqvmap\maps\jquery.vmap.world.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        //-initialize the javascript
        App.init();
        App.dashboard();

    });
</script>

</html>

