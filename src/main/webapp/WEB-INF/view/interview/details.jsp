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
                    <c:if test = "${roleName == 'admin' || roleName == 'manager' || roleName == 'recruiter'}">
                        <div class="d-flex justify-content-end">
                            <a href="javascript:void(0);" onclick="confirmDelete(${interview.interviewId})">
                                <button class="btn btn-space btn-secondary btn-width active">Delete</button>
                            </a>
                        </div>
                    </c:if>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="bs-grid-block">
                                <div class="card">
                                    <div class="card-body">

                                        <form>
                                            <div class="form-group row">
                                                <div class="col-12 col-sm-8 col-lg-6 text-sm-left">
                                                    <div class="card" style="padding: 0; margin: 0">
                                                        <div class="card-header card-header-divider" style="padding: 0; margin: 0; font-weight: 400; font-size: 20px">Schedule title</div>
                                                        <div class="card-body" style="padding: 0; margin: 0; font-size: 14px; font-weight: 400">
                                                            <span>${interview.title}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <div class="col-12 col-sm-8 col-lg-6 text-sm-left">
                                                    <div class="card" style="padding: 0; margin: 0">
                                                        <div class="card-header card-header-divider" style="padding: 0; margin: 0; font-weight: 400; font-size: 20px">Candidate</div>
                                                        <div class="card-body" style="padding: 0; margin: 0; font-size: 14px; font-weight: 400">
                                                            <ul class="list-unstyled">
                                                                <li>Name: <span>${interview.candidate.name}</span></li>
                                                                <li>Date of birth: <span>${interview.candidate.dob}</span></li>
                                                                <li>Address: <span>${interview.candidate.address}</span></li>
                                                                <li>Email: <span>${interview.candidate.email}</span></li>
                                                                <li>Phone number: <span>${interview.candidate.phone}</span></li>
                                                                <li>Skills: <span>${interview.candidate.skills}</span></li>
                                                                <li>Position: <span>${interview.candidate.currentPosition}</span></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <div class="col-12 col-sm-8 col-lg-6 text-sm-left">
                                                    <div class="card" style="padding: 0; margin: 0">
                                                        <div class="card-header card-header-divider" style="padding: 0; margin: 0; font-weight: 400; font-size: 20px">Schedule Time</div>
                                                        <div class="card-body" style="padding: 0; margin: 0; font-size: 14px; font-weight: 400">
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
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <div class="col-12 col-sm-8 col-lg-6 text-sm-left">
                                                    <div class="card" style="padding: 0; margin: 0">
                                                        <div class="card-header card-header-divider" style="padding: 0; margin: 0; font-weight: 400; font-size: 20px">Notes</div>
                                                        <div class="card-body" style="padding: 0; margin: 0; font-size: 14px; font-weight: 400">
                                                            <span>${interview.note}</span>
                                                        </div>
                                                    </div>
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
                                                <div class="col-12 col-sm-8 col-lg-6 text-sm-left">
                                                    <div class="card" style="padding: 0; margin: 0">
                                                        <div class="card-header card-header-divider" style="padding: 0; margin: 0; font-weight: 400; font-size: 20px">Job</div>
                                                        <div class="card-body" style="padding: 0; margin: 0; font-size: 14px; font-weight: 400">
                                                            <ul class="list-unstyled">
                                                                <li>Title: <span>${interview.job.title}</span></li>
                                                                <li>Location: <span>${interview.job.location}</span></li>
                                                                <li>level: <span>${interview.job.level}</span></li>
                                                                <li>Status: <span>${interview.job.status}</span></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="form-group row">
                                                <div class="col-12 col-sm-8 col-lg-6 text-sm-left">
                                                    <div class="card" style="padding: 0; margin: 0">
                                                        <div class="card-header card-header-divider" style="padding: 0; margin: 0; font-weight: 400; font-size: 20px">Interviewer</div>
                                                        <div class="card-body" style="padding: 0; margin: 0; font-size: 14px; font-weight: 400; padding-top: 6px">
                                                            <c:forEach var="scheduleInterview" items="${interview.scheduledInterviews}">
                                                                <ul class="list-unstyled" style="line-height: 6px">
                                                                    <li><span>${scheduleInterview.interviewer.fullName} | ${scheduleInterview.interviewer.department}</span></li>
                                                                </ul>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <div class="col-12 col-sm-8 col-lg-6 text-sm-left">
                                                    <div class="card" style="padding: 0; margin: 0">
                                                        <div class="card-header card-header-divider" style="padding: 0; margin: 0; font-weight: 400; font-size: 20px">Location</div>
                                                        <div class="card-body" style="padding: 0; margin: 0; font-size: 14px; font-weight: 400">
                                                            <span>${interview.location}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <div class="col-12 col-sm-8 col-lg-6 text-sm-left">
                                                    <div class="card" style="padding: 0; margin: 0">
                                                        <div class="card-header card-header-divider" style="padding: 0; margin: 0; font-weight: 400; font-size: 20px">Recruiter owner</div>
                                                        <div class="card-body" style="padding: 0; margin: 0; font-size: 14px; font-weight: 400">
                                                            <ul class="list-unstyled">
                                                                <li>Full name: <span>${interview.recruiter.fullName}</span></li>
                                                                <li>Date of birth: <span>${interview.recruiter.dob}</span></li>
                                                                <li>Address: <span>${interview.recruiter.address}</span></li>
                                                                <li>Email: <span>${interview.recruiter.email}</span></li>
                                                                <li>Phone number: <span>${interview.recruiter.phoneNumber}</span></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <div class="col-12 col-sm-8 col-lg-6 text-sm-left">
                                                    <div class="card" style="padding: 0; margin: 0">
                                                        <div class="card-header card-header-divider" style="padding: 0; margin: 0; font-weight: 400; font-size: 20px">Meeting ID</div>
                                                        <div class="card-body" style="padding: 0; margin: 0; font-size: 14px; font-weight: 400">
                                                            <span>${interview.meetingId}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <div class="col-12 col-sm-8 col-lg-6 text-sm-left">
                                                    <div class="card" style="padding: 0; margin: 0">
                                                        <div class="card-header card-header-divider" style="padding: 0; margin: 0; font-weight: 400; font-size: 20px">Result</div>
                                                        <div class="card-body" style="padding: 0; margin: 0; font-size: 14px; font-weight: 400">
                                                            <span>${interview.result.name().toString()}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <div class="col-12 col-sm-8 col-lg-6 text-sm-left">
                                                    <div class="card" style="padding: 0; margin: 0">
                                                        <div class="card-header card-header-divider" style="padding: 0; margin: 0; font-weight: 400; font-size: 20px">Status</div>
                                                        <div class="card-body" style="padding: 0; margin: 0; font-size: 14px; font-weight: 400">
                                                            <span>${interview.status.name().toString()}</span>
                                                        </div>
                                                    </div>
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
                                            <c:if test = "${roleName == 'admin' || roleName == 'manager' || roleName == 'recruiter'}">
                                                <a href="/interview/edit?interview_id=${interview.interviewId}">
                                                    <button class="mr-6 btn btn-space btn-secondary btn-width active">Edit</button>
                                                </a>
                                            </c:if>
                                            <c:if test = "${roleName == 'interviewer'}">
                                                <a href="/interview/edit?interview_id=${interview.interviewId}">
                                                    <button class="mr-6 btn btn-space btn-secondary btn-width active">Edit Result</button>
                                                </a>
                                            </c:if>
                                            <a href="/interview/list">
                                                <button class="ml-6 btn btn-space btn-secondary btn-width active">Cancel</button>
                                            </a>
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