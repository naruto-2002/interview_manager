<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="assets/img/logo-fav.png">
    <title>Beagle</title>
    <link rel="stylesheet" type="text/css" href="assets/lib/perfect-scrollbar/css/perfect-scrollbar.css">
    <link rel="stylesheet" type="text/css" href="assets/lib/material-design-icons/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" type="text/css" href="assets/lib/datatables/datatables.net-bs4/css/dataTables.bootstrap4.css">
    <link rel="stylesheet" type="text/css" href="assets/lib/datatables/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="assets/css/app.css" type="text/css">
    <link rel="stylesheet" href="/interview_schedule_list/style.css">
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
                                <button class="btn btn-space btn-secondary btn-width active">Add new</button>
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
                                <tr>
                                    <td>1</td>
                                    <td>Nguyen Anh Duc</td>
                                    <td>eNguyen Khac Hoan</td>
                                    <td>22/02/2022 09:00 - 10:30</td>
                                    <td>Pass</td>
                                    <td>Extra Info 1</td>
                                    <td>Extra Info 2</td>
                                    <td class="d-flex align-items-center">
                                        <div class="icon"><span class="mdi mdi-eye"></span></div>
                                        <div class="icon"><span class="mdi mdi-edit"></span></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>Nguyen Anh Duc</td>
                                    <td>bNguyen Khac Hoan</td>
                                    <td>22/02/2022 09:00 - 10:30</td>
                                    <td>Pass</td>
                                    <td>Extra Info 1</td>
                                    <td>Extra Info 2</td>
                                    <td class="d-flex align-items-center">
                                        <div class="icon"><span class="mdi mdi-eye"></span></div>
                                        <div class="icon"><span class="mdi mdi-edit"></span></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>Nguyen Anh Duc</td>
                                    <td>aNguyen Khac Hoan</td>
                                    <td>22/02/2022 09:00 - 10:30</td>
                                    <td>Pass</td>
                                    <td>Extra Info 1</td>
                                    <td>Extra Info 2</td>
                                    <td class="d-flex align-items-center">
                                        <div class="icon"><span class="mdi mdi-eye"></span></div>
                                        <div class="icon"><span class="mdi mdi-edit"></span></div>
                                    </td>
                                </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <%@include file="../lay_out/setting.jsp"%>
</div>
<script src="assets/lib/jquery/jquery.min.js" type="text/javascript"></script>
<script src="assets/lib/perfect-scrollbar/js/perfect-scrollbar.min.js" type="text/javascript"></script>
<script src="assets/lib/bootstrap/dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script src="assets/js/app.js" type="text/javascript"></script>
<script src="assets/lib/datatables/datatables.net/js/jquery.dataTables.js" type="text/javascript"></script>
<script src="assets/lib/datatables/datatables.net-bs4/js/dataTables.bootstrap4.js" type="text/javascript"></script>
<script src="assets/lib/datatables/datatables.net-buttons/js/dataTables.buttons.min.js" type="text/javascript"></script>
<script src="assets/lib/datatables/datatables.net-buttons/js/buttons.flash.min.js" type="text/javascript"></script>
<script src="assets/lib/datatables/jszip/jszip.min.js" type="text/javascript"></script>
<script src="assets/lib/datatables/pdfmake/pdfmake.min.js" type="text/javascript"></script>
<script src="assets/lib/datatables/pdfmake/vfs_fonts.js" type="text/javascript"></script>
<script src="assets/lib/datatables/datatables.net-buttons/js/buttons.colVis.min.js" type="text/javascript"></script>
<script src="assets/lib/datatables/datatables.net-buttons/js/buttons.print.min.js" type="text/javascript"></script>
<script src="assets/lib/datatables/datatables.net-buttons/js/buttons.html5.min.js" type="text/javascript"></script>
<script src="assets/lib/datatables/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js" type="text/javascript"></script>
<script src="assets/lib/datatables/datatables.net-responsive/js/dataTables.responsive.min.js" type="text/javascript"></script>
<script src="assets/lib/datatables/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js" type="text/javascript"></script>
<script src="/interview_schedule_list/script.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        //-initialize the javascript
        App.init();
        App.dataTables();
    });
</script>
</body>
</html>