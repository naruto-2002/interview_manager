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
    <link rel="stylesheet" type="text/css" href="/multiselect/css/multi-select.css">
    <link rel="stylesheet" href="/css/app.css" type="text/css">
    <link rel="stylesheet" href="/css/interview/add.css">
</head>
<body>
<div class="be-wrapper">
    <%@include file="../layout/header.jsp"%>
    <%@include file="../layout/left-sidebar.jsp"%>


    <div class="be-content">
        <div class="page-head">
            <h2 class="page-head-title">Edit Interview Schedule</h2>
        </div>
        <div class="main-content container-fluid">
            <div class="card text-center">
                <div class="card-body">
                    <form:form action="/interview/edit_details" method="post" modelAttribute="newInterview">
                        <form:input type="text" class="d-none" id="title" path="interviewId" value="${newInterview.interviewId}" />
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="bs-grid-block">
                                    <div class="card">
                                        <div class="card-body">
                                            <c:if test = "${roleName == 'admin' || roleName == 'manager' || roleName == 'recruiter'}">
                                                <div class="form-group row">
                                                    <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4 star" for="title">Schedule title</label>
                                                    <div class="col-12 col-sm-8 col-lg-8">
                                                        <form:input type="text" class="form-control" id="title" path="title" placeholder="Type a title..." />
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4 star" for="candidate">Candidate name</label>
                                                    <div class="col-12 col-sm-8 col-lg-8 text-sm-left">
                                                        <form:input type="text" class="d-none" id="title" path="candidate.id" value="${candidate.id}" />
                                                        <input class="form-control" id="candidate" type="text" readonly="readonly" value="${candidate.name}"/>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4 star">Schedule Time</label>
                                                    <div class="col-12 col-sm-8 col-lg-8">
                                                        <div class="input-group date datetimepicker" data-min-view="2" data-date-format="yyyy-mm-dd">
                                                            <form:input type="text" class="form-control" id="date" path="date" placeholder="yyyy-mm-dd"/>
                                                            <div class="input-group-append">
                                                                <button class="btn btn-primary"><i class="icon-th mdi mdi-calendar"></i></button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class=" form-group row d-flex justify-content-center">
                                                    <label class="col-form-label text-sm-right mr-2" for="startTime">From:</label>
                                                    <form:input class="col-2 form-control input-spacing mr-4" id="startTime" path="startTime" type="text" placeholder="hh:mm"/>
                                                    <label class="col-form-label text-sm-right mr-2" for="endTime">To:</label>
                                                    <form:input class="col-2 form-control mr-6" id="endTime" path="endTime" type="text" placeholder="hh:mm"/>
                                                </div>
                                            </c:if>

                                            <c:if test = "${roleName == 'interviewer'}">
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
                                                                    <li>Phone: <span>${interview.candidate.phone}</span></li>
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
                                            </c:if>

                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4 " for="note">Notes</label>
                                                <div class="col-12 col-sm-8 col-lg-8">
                                                    <form:textarea class="form-control" id="note" path="note" placeholder="Type a note..."/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="bs-grid-block">
                                    <div class="card">
                                        <div class="card-body">
                                            <c:if test = "${roleName == 'admin' || roleName == 'manager' || roleName == 'recruiter'}">
                                                <div class="form-group row">
                                                    <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4 star">Job</label>
                                                    <div class="col-12 col-sm-8 col-lg-8 text-sm-left">
                                                        <form:select class="select2" id="job" path="job.jobId">
                                                            <option value="" disabled selected>Select a job</option>
                                                            <c:forEach var="candidateJob" items="${candidateJobs}">
                                                                <form:option value="${candidateJob.job.jobId}">
                                                                    ${candidateJob.job.title} | ${candidateJob.job.status}
                                                                </form:option>
                                                            </c:forEach>
                                                        </form:select>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4 star">Interviewer</label>
                                                    <div class="col-12 col-sm-8 col-lg-8" style="font-size: 16px">
                                                        <div class="table-container">
                                                            <table class="table table-striped table-borderless">
                                                                <tr>
                                                                    <td>
                                                                        <form:select id="searchable" multiple="multiple" path="selectedInterviewerIds">
                                                                            <c:forEach var="interviewer" items="${interviewers}">
                                                                                <c:choose>
                                                                                    <c:when test="${newInterview.selectedInterviewerIds != null && newInterview.selectedInterviewerIds.contains(interviewer.userId)}">
                                                                                        <form:option value="${interviewer.userId}" selected="true">
                                                                                            ${interviewer.fullName} | ${interviewer.department}
                                                                                        </form:option>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <form:option value="${interviewer.userId}">
                                                                                            ${interviewer.fullName} | ${interviewer.department}
                                                                                        </form:option>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </c:forEach>
                                                                        </form:select>

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4 star" for="recruiter">Recruiter owner</label>
                                                    <div class="col-12 col-sm-8 col-lg-8 text-sm-left">
                                                        <form:input type="text" class="d-none" id="title" path="recruiter.userId" value="${candidate.user.userId}" />
                                                        <input class="form-control" id="recruiter" type="text" readonly="readonly" value="${candidate.user.fullName}"/>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4" for="location">Location</label>
                                                    <div class="col-12 col-sm-8 col-lg-8">
                                                        <form:input class="form-control" id="location" path="location" type="text" placeholder="Type a location..."/>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4" for="meetingId">Meeting ID</label>
                                                    <div class="col-12 col-sm-8 col-lg-8">
                                                        <form:input class="form-control" id="meetingId" path="meetingId" type="text" placeholder="Type a meeting id..."/>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <c:if test = "${roleName == 'interviewer'}">
                                                <div class="form-group row">
                                                    <div class="col-12 col-sm-8 col-lg-6 text-sm-left">
                                                        <div class="card" style="padding: 0; margin: 0">
                                                            <div class="card-header card-header-divider" style="padding: 0; margin: 0; font-weight: 400; font-size: 20px">Job</div>
                                                            <div class="card-body" style="padding: 0; margin: 0; font-size: 14px; font-weight: 400">
                                                                <ul class="list-unstyled">
                                                                    <li>Title: <span>${interview.job.title}</span></li>
                                                                    <li>Location: <span>${interview.job.location}</span></li>
                                                                    <li>Level: <span>${interview.job.level}</span></li>
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
                                            </c:if>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4">Result</label>
                                                <div class="col-12 col-sm-8 col-lg-8 text-sm-left">
                                                    <form:select class="select2" id="result" path="result">
                                                        <option value="" disabled selected>Select a result</option>
                                                        <c:forEach var="result" items="${results}">
                                                            <form:option value="${result}">${result}</form:option>
                                                        </c:forEach>
                                                    </form:select>
                                                </div>
                                            </div>
                                            <c:if test = "${roleName == 'admin' || roleName == 'manager' || roleName == 'recruiter'}">
                                                <div class="form-group row">
                                                    <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4">Status</label>
                                                    <div class="col-12 col-sm-8 col-lg-8 text-sm-left">
                                                        <form:select class="select2" id="status" path="status">
                                                            <option value="" disabled selected>Select a status</option>
                                                            <c:forEach var="status" items="${states}">
                                                                <form:option value="${status}">${status}</form:option>
                                                            </c:forEach>
                                                        </form:select>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <c:if test = "${roleName == 'interviewer'}">
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
                                            </c:if>
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
                                            <div class="">
                                                <c:if test = "${roleName == 'admin' || roleName == 'manager' || roleName == 'recruiter'}">
                                                    <c:if test = "${interview.interviewId == null}">
                                                        <a href="/interview/add_candidate">
                                                            <button type="button" class="ml-6 btn btn-space btn-secondary btn-width active">Back</button>
                                                        </a>
                                                    </c:if>
                                                    <c:if test = "${interview.interviewId != null}">
                                                        <a href="/interview/edit_candidate?interviewId=${interview.interviewId}">
                                                            <button type="button" class="ml-6 btn btn-space btn-secondary btn-width active">Back</button>
                                                        </a>
                                                    </c:if>

                                                    <button type="submit" class="ml-6 btn btn-space btn-secondary btn-width active">Submit</button>
                                                    <a href="/interview/list">
                                                        <button type="button" class="ml-6 btn btn-space btn-secondary btn-width active">Cancel</button>
                                                    </a>
                                                </c:if>

                                                <c:if test = "${roleName == 'interviewer'}">
                                                    <button type="submit" class="ml-6 btn btn-space btn-secondary btn-width active">Submit</button>
                                                    <a href="/interview/list">
                                                        <button type="button" class="ml-6 btn btn-space btn-secondary btn-width active">Cancel</button>
                                                    </a>
                                                </c:if>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form:form>
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
<script src="/lib/bootstrap/dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script src="/lib/multiselect/js/jquery.multi-select.js" type="text/javascript"></script>
<script src="/lib/quicksearch/jquery.quicksearch.min.js" type="text/javascript"></script>
<script src="/lib/select2/js/select2.min.js" type="text/javascript"></script>
<script src="/lib/select2/js/select2.full.min.js" type="text/javascript"></script>
<script src="/lib/bootstrap-slider/bootstrap-slider.min.js" type="text/javascript"></script>
<script src="/lib/bs-custom-file-input/bs-custom-file-input.js" type="text/javascript"></script>
<script src="/js/interview/add.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        //-initialize the javascript
        App.init();
        App.formElements();
        App.formMultiselect();
        App.IconsFilter();
    });
</script>

</body>
</html>



