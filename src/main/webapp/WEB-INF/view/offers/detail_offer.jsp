<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Offer Details</title>
    <link rel="stylesheet" type="text/css" href="/lib/perfect-scrollbar/css/perfect-scrollbar.css">
    <link rel="stylesheet" type="text/css" href="/lib/material-design-icons/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" type="text/css" href="/lib/datatables/datatables.net-bs4/css/dataTables.bootstrap4.css">
    <link rel="stylesheet" type="text/css"
          href="/lib/datatables/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="/css/app.css" type="text/css">
</head>
<body>
<jsp:include page="../layout/header.jsp"/>
<jsp:include page="../layout/left-sidebar.jsp"/>

<div class="be-content" style="margin-top: 60px;">
    <div class="main-content container-fluid">
        <div class="page-head" style="margin-top: 60px;">
            <h2 class="page-head-title">Offer Details</h2>
            <nav aria-label="breadcrumb mt-2" role="navigation">
                <ol class="breadcrumb page-head-nav">
                    <li class="breadcrumb-item"><a href="/offers">Offer List</a></li>
                    <li class="breadcrumb-item active">Offer Details</li>
                </ol>
            </nav>
        </div>

        <div class="">
            <h1>Offer Details</h1>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Candidate:</label>
                        <p>${offer.candidate.fullName}</p>
                    </div>
                    <div class="form-group">
                        <label>Position:</label>
                        <p>${offer.position}</p>
                    </div>
                    <div class="form-group">
                        <label>Approved by:</label>
                        <p>${offer.approver.fullName}</p>
                    </div>
                    <div class="form-group">
                        <label>Interview Schedule:</label>
                        <p>${offer.scheduledInterview.interview.title}</p>
                    </div>
                    <div class="form-group">
                        <label>Start Contract:</label>
                        <p>${offer.startContract}</p>
                    </div>
                    <div class="form-group">
                        <label>End Contract:</label>
                        <p>${offer.endContract}</p>
                    </div>
                    <div class="form-group">
                        <label>Due Date:</label>
                        <p>${offer.dueDate}</p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Contract Type:</label>
                        <p>${offer.contractType}</p>
                    </div>
                    <div class="form-group">
                        <label>Level:</label>
                        <p>${offer.level}</p>
                    </div>
                    <div class="form-group">
                        <label>Department:</label>
                        <p>${offer.department}</p>
                    </div>
                    <div class="form-group">
                        <label>Recruiter:</label>
                        <p>${offer.recruiter.fullNameWithAccountName}</p>
                    </div>
                    <div class="form-group">
                        <label>Basic Salary:</label>
                        <p>${offer.basicSalary}</p>
                    </div>
                    <div class="form-group">
                        <label>Status:</label>
                        <p>${offer.status}</p>
                    </div>
                    <div class="form-group">
                        <label>Note:</label>
                        <p>${offer.note}</p>
                    </div>
                </div>
            </div>

            <div class="row d-f justify-content-center">

                <a href="${pageContext.request.contextPath}/offers/edit/${offer.offerId}"
                   class="btn btn-info p-2 px-6 text-center">Edit Offer</a>
                <span class="m-2"></span>
                <button class="btn btn-secondary p-2 px-6 text-center" onclick="window.history.back();">Back</button>
            </div>
        </div>
    </div>
</div>

<script src="/lib/jquery/jquery.min.js" type="text/javascript"></script>
<script src="/lib/perfect-scrollbar/js/perfect-scrollbar.min.js" type="text/javascript"></script>
<script src="/lib/bootstrap/dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script src="/js/app.js" type="text/javascript"></script>
<script src="/lib/jquery.sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
<script src="/lib/countup/countUp.min.js" type="text/javascript"></script>
<script src="/lib/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="/lib/jqvmap/jquery.vmap.min.js" type="text/javascript"></script>
<script src="/lib/jqvmap/maps/jquery.vmap.world.js" type="text/javascript"></script>
</body>
</html>
