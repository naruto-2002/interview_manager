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
    <link rel="stylesheet" type="text/css" href="/lib/material-design-icons/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" type="text/css" href="/lib/datetimepicker/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" type="text/css" href="/lib/select2/css/select2.min.css">
    <link rel="stylesheet" type="text/css" href="/lib/bootstrap-slider/css/bootstrap-slider.min.css">
    
    <link rel="stylesheet" href="/css/app.css" type="text/css">
    <link rel="stylesheet" href="/css/interview/details.css">
</head>
<body>
<div class="be-wrapper">
    <%@include file="../layout/header.jsp"%>
    <%@include file="../layout/left-sidebar.jsp"%>


    <div class="be-content">
        <div class="page-head">
            <h2 class="page-head-title">Interview Schedule Details</h2>
        </div>
        <div class="main-content container-fluid">
            <div class="card text-center">
                <div class="card-header">
                    <div class="d-flex justify-content-end">
                        <a href="/interview/delete?interviewId=${interview.interviewId}">
                            <button class="btn btn-space btn-secondary btn-width active">Delete</button>
                        </a>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="bs-grid-block">
                                <div class="card">
                                    <div class="card-body">

                                        <form>
                                            <div class="form-group row d-flex align-items-center">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4" >Schedule title:</label>
                                                <div class="col-12 col-sm-8 col-lg-6 text-sm-left col-form-label" >
                                                    <span>${interview.title}</span>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4" >Candidate name:</label>
                                                <div class="col-12 col-sm-8 col-lg-6 text-sm-left col-form-label">
                                                    <span>${interview.candidate.fullName}</span>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4" >Schedule Time:</label>
                                                <div class="col-12 col-sm-8 col-lg-6 text-sm-left col-form-label" >
                                                    <ul style="list-style: none; padding: 0">
                                                        <li>
                                                            <span>${interview.date}</span>
                                                        </li>
                                                        <li>
                                                            <span>From: ${interview.startTime} To: ${interview.endTime}</span>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="form-group row d-flex justify-content-start">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4" >Notes:</label>
                                                <div class="col-12 col-sm-8 col-lg-6 text-sm-left col-form-label" >
                                                    <span>${interview.note}</span>
                                                </div>
                                            </div>

                                        </form>

                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="bs-grid-block">
                                <div class="card">
                                    <div class="card-body">
                                        <form>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4">Job:</label>
                                                <div class="col-12 col-sm-8 col-lg-6 text-sm-left col-form-label">
                                                    <span>${interview.job.title}</span>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4">Interviewer:</label>
                                                <div class="col-12 col-sm-8 col-lg-6 text-sm-left col-form-label">
                                                    <c:forEach var="scheduleInterview" items="${interview.scheduledInterviews}">
                                                        <soan>${scheduleInterview.interviewer.username}</soan>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4">Location:</label>
                                                <div class="col-12 col-sm-8 col-lg-6 text-sm-left col-form-label">
                                                    <span>${interview.location}</span>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4">Recruiter owner:</label>
                                                <div class="col-12 col-sm-8 col-lg-6 text-sm-left col-form-label">
                                                    <span>${interview.recruiter.fullName}</span>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4">Meeting ID:</label>
                                                <div class="col-12 col-sm-8 col-lg-6 text-sm-left col-form-label">
                                                    <span>${interview.meetingId}</span>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4">Result:</label>
                                                <div class="col-12 col-sm-8 col-lg-6 text-sm-left col-form-label">
                                                    <span>${interview.result == null ? "N/A" : interview.status}</span>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4">Status:</label>
                                                <div class="col-12 col-sm-8 col-lg-6 text-sm-left col-form-label">
                                                    <span>${interview.status == null ? "NEW" : interview.status}</span>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="bs-grid-block">
                                <div class="card text-center">
                                    <div class="d-flex justify-content-center align-items-center card-body">
                                        <div class="d-flex">
                                            <button class="mr-6 btn btn-space btn-secondary btn-width active">Edit</button>
                                            <button class="ml-6 btn btn-space btn-secondary btn-width active">Cancel</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<script src="/lib/jquery/jquery.min.js" type="text/javascript"></script>
<script src="/lib/perfect-scrollbar/js/perfect-scrollbar.min.js" type="text/javascript"></script>
<script src="/lib/bootstrap/dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script src="/js/app.js" type="text/javascript"></script>
<script src="/lib/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="/lib/jquery.nestable/jquery.nestable.js" type="text/javascript"></script>
<script src="/lib/moment.js/min/moment.min.js" type="text/javascript"></script>
<script src="/lib/datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<script src="/lib/select2/js/select2.min.js" type="text/javascript"></script>
<script src="/lib/select2/js/select2.full.min.js" type="text/javascript"></script>
<script src="/lib/bootstrap-slider/bootstrap-slider.min.js" type="text/javascript"></script>
<script src="/lib/bs-custom-file-input/bs-custom-file-input.js" type="text/javascript"></script>

<script src="/js/interview/details.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        //-initialize the javascript
        App.init();
        App.formElements();
    });
</script>
</body>
</html>