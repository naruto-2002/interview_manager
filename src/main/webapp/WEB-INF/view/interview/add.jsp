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
            <h2 class="page-head-title">Add Interview Schedule</h2>
        </div>
        <div class="main-content container-fluid">
            <div class="card text-center">
                <div class="card-body">
                    <form:form action="/interview/add" method="post" modelAttribute="newInterview">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="bs-grid-block">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4 star" for="title">Schedule title</label>
                                                <div class="col-12 col-sm-8 col-lg-8">
                                                    <form:input type="text" class="form-control" id="title" path="title" />
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4 star">Candidate name</label>
                                                <div class="col-12 col-sm-8 col-lg-8">
                                                    <form:select class="select2" id="candidate" path="candidate.candidateId" >
                                                        <option value="" disabled selected>Select a candidate</option>
                                                        <c:forEach var="candidate" items="${candidates}">
                                                            <form:option value="${candidate.candidateId}">${candidate.fullName}</form:option>
                                                        </c:forEach>
                                                    </form:select>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4 star">Schedule Time</label>
                                                <div class="col-12 col-sm-8 col-lg-8">
                                                    <div class="input-group date datetimepicker" data-min-view="2" data-date-format="yyyy-mm-dd">
                                                        <form:input type="text" class="form-control" id="date" path="date" />
                                                        <div class="input-group-append">
                                                            <button class="btn btn-primary"><i class="icon-th mdi mdi-calendar"></i></button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class=" form-group row d-flex justify-content-center">
                                                <label class="col-form-label text-sm-right mr-2" for="startTime">From:</label>
                                                <form:input class="col-2 form-control input-spacing mr-4" id="startTime" path="startTime" type="text" />
                                                <label class="col-form-label text-sm-right mr-2" for="endTime">To:</label>
                                                <form:input class="col-2 form-control mr-6" id="endTime" path="endTime" type="text" />
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4 " for="note">Notes    </label>
                                                <div class="col-12 col-sm-8 col-lg-8">
                                                    <form:textarea class="form-control" id="note" path="note"/>
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
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4 star">Job</label>
                                                <div class="col-12 col-sm-8 col-lg-8">
                                                    <form:select class="select2" id="job" path="job.jobId">
                                                        <option value="" disabled selected>Select a job</option>
                                                        <c:forEach var="job" items="${jobs}">
                                                            <form:option value="${job.jobId}">${job.title}</form:option>
                                                        </c:forEach>
                                                    </form:select>

                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4 star">Interviewer</label>
                                                <div class="col-12 col-sm-8 col-lg-8">
                                                    <div class="table-container">
                                                        <table class="table table-striped table-borderless">
                                                            <tr>
                                                                <td>
                                                                    <form:select id="searchable" multiple="multiple"  path="selectedInterviewerIds">
                                                                        <c:forEach var="interviewer" items="${interviewers}">
                                                                            <form:option value="${interviewer.userId}">
                                                                                ${interviewer.fullName}
                                                                            </form:option>
                                                                        </c:forEach>
                                                                    </form:select>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4" for="location">Location</label>
                                                <div class="col-12 col-sm-8 col-lg-8">
                                                    <form:input class="form-control" id="location" path="location" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4 star">Recruiter owner</label>
                                                <div class="col-12 col-sm-8 col-lg-8">
                                                    <form:select class="select2" id="recruiter" path="recruiter.userId">
                                                        <option value="" disabled selected>Select a recruiter</option>
                                                        <c:forEach var="recruiter" items="${recruiters}">
                                                            <form:option value="${recruiter.userId}">${recruiter.fullName}</form:option>
                                                        </c:forEach>
                                                    </form:select>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4" for="meetingId">Meeting ID</label>
                                                <div class="col-12 col-sm-8 col-lg-8">
                                                    <form:input class="form-control" id="meetingId" path="meetingId" type="text"/>
                                                </div>
                                            </div>
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
                                                <button type="submit" class="mr-6 btn btn-space btn-secondary btn-width active">Submit</button>
                                                <a href="/interview/list">
                                                    <button type="button" class="ml-6 btn btn-space btn-secondary btn-width active">Cancel</button>
                                                </a>

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



