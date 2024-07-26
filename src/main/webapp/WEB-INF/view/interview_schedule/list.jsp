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
    <link rel="stylesheet" type="text/css" href="/lib/datatables/datatables.net-bs4/css/dataTables.bootstrap4.css">
    <link rel="stylesheet" type="text/css" href="/lib/datatables/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="/css/app.css" type="text/css">
    <link rel="stylesheet" href="/css/interview_schedule/list.css">
</head>
<body>
<div class="be-wrapper">
    <%@include file="../lay_out/header.jsp"%>
    <%@include file="../lay_out/menu.jsp"%>

    <div class="be-content">
        <div class="page-head">
            <h2 class="page-head-title">Interview Schedule List</h2>
        </div>
        <div class="main-content container-fluid">
            <div class="row">
                <div class="col-sm-12">
                    <div class="card card-table">
                        <div class="card-header">
                            <div class="d-flex justify-content-end">
                                <a href="/interview_schedule/add_new">
                                    <button class="btn btn-space btn-secondary btn-width active">Add new</button>
                                </a>
                            </div>
                        </div>
                        <div class="card-body">
                            <table class="table table-striped table-hover table-bordered " id="table1">
                                <thead>
                                <tr>
                                    <th>Title</th>
                                    <th>Candidate Name</th>
                                    <th>Interviewer</th>
                                    <th>Schedule</th>
                                    <th>Result</th>
                                    <th>Status</th>
                                    <th>Job</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="interviewSchedule" items="${interviewScheduleList}">
                                    <tr>
                                        <td>${interviewSchedule.title}</td>
                                        <td>${interviewSchedule.candidate.fullName}</td>
                                        <td>${interviewSchedule.interviewer.fullName}</td>
                                        <td>${interviewSchedule.startTime} to ${interviewSchedule.endTime}</td>
                                        <td>${interviewSchedule.status}</td>
                                        <td>${interviewSchedule.result}</td>
                                        <td>${interviewSchedule.job.title}</td>
                                        <td class="d-flex align-items-center">
                                            <div class="icon"><span class="mdi mdi-eye"></span></div>
                                            <div class="icon"><span class="mdi mdi-edit"></span></div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
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
<script src="/lib/datatables/datatables.net/js/jquery.dataTables.js" type="text/javascript"></script>
<script src="/lib/datatables/datatables.net-bs4/js/dataTables.bootstrap4.js" type="text/javascript"></script>
<script src="/lib/datatables/datatables.net-buttons/js/dataTables.buttons.min.js" type="text/javascript"></script>
<script src="/lib/datatables/datatables.net-buttons/js/buttons.flash.min.js" type="text/javascript"></script>
<script src="/lib/datatables/jszip/jszip.min.js" type="text/javascript"></script>
<script src="/lib/datatables/pdfmake/pdfmake.min.js" type="text/javascript"></script>
<script src="/lib/datatables/pdfmake/vfs_fonts.js" type="text/javascript"></script>
<script src="/lib/datatables/datatables.net-buttons/js/buttons.colVis.min.js" type="text/javascript"></script>
<script src="/lib/datatables/datatables.net-buttons/js/buttons.print.min.js" type="text/javascript"></script>
<script src="/lib/datatables/datatables.net-buttons/js/buttons.html5.min.js" type="text/javascript"></script>
<script src="/lib/datatables/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js" type="text/javascript"></script>
<script src="/lib/datatables/datatables.net-responsive/js/dataTables.responsive.min.js" type="text/javascript"></script>
<script src="/lib/datatables/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js" type="text/javascript"></script>
<script src="/js/interview_schedule/list.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        //-initialize the javascript
        App.init();
        App.dataTables();
    });
</script>
</body>
</html>