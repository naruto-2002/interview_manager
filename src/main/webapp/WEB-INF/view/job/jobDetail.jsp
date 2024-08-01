<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Detail</title>
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="/css/app.css" type="text/css">
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- <link href="/css/demo.css" rel="stylesheet"> -->

</head>

<body>
<jsp:include page="../layout/header.jsp" />
<jsp:include page="../layout/left-sidebar.jsp" />
<div class="be-content mt-5">
    <div class="main-content container-fluid">
        <div class="col-12 mx-auto">
            <div class="d-flex justify-content-between mb-3">
                <h3>Job Detail ${jobdetail.jobId}</h3>
            </div>

            <hr />

            <div class="card">
                <div class="card-header">
                    Job information
                </div>

                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <p><strong>Id:</strong> ${jobdetail.jobId}</p>
                            <p><strong>Title:</strong> ${jobdetail.title}</p>
                            <p><strong>Required Skills:</strong> ${jobdetail.requiredSkills}</p>
                            <p><strong>Location:</strong> ${jobdetail.location}</p>
                            <p><strong>Level:</strong> ${jobdetail.level}</p>
                        </div>
                        <div class="col-md-6">
                            <p><strong>Description:</strong> ${jobdetail.description}</p>
                            <p><strong>Start Date:</strong> ${jobdetail.startDate}</p>
                            <p><strong>End Date:</strong> ${jobdetail.endDate}</p>
                            <p><strong>Benefits:</strong> ${jobdetail.benefits}</p>
                            <p><strong>Status:</strong> ${jobdetail.status}</p>
                            <p><strong>Salary From:</strong> ${jobdetail.salaryFrom}</p>
                            <p><strong>Salary To:</strong> ${jobdetail.salaryTo}</p>
                        </div>
                    </div>
                </div>
            </div>

            <hr />

            <div class="btn-container mt-3">
                <a href="/job" class="btn btn-success">Back</a>
                <a href="/job/update/${jobdetail.jobId}" class="btn btn-warning">Edit</a>
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
<style>
    .table th,
    .table td {
        padding: 8px;
        text-align: left;
    }

    .table th {
        border-bottom: 2px solid #ddd;
    }

    .table td:first-child {
        border-right: 2px solid #ddd;
    }

    .btn-container {
        display: flex;
        justify-content: flex-start;
        gap: 10px;
        margin-top: 10px;
    }
</style>

</html>