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
    <link rel="stylesheet" href="/css/interview_schedule/details.css">
</head>
<body>
<div class="be-wrapper">
    <%@include file="../lay_out/header.jsp"%>
    <%@include file="../lay_out/menu.jsp"%>


    <div class="be-content">
        <div class="page-head">
            <h2 class="page-head-title">Interview Schedule Details</h2>
        </div>
        <div class="main-content container-fluid">
            <div class="card text-center">
                <div class="card-header">
                    <div class="d-flex justify-content-end">
                        <button class="btn btn-space btn-secondary btn-width active">Send reminder</button>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="bs-grid-block">
                                <div class="card">
                                    <div class="card-body">

                                        <form>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4" for="inputReadonly3">Schedule title</label>
                                                <div class="col-12 col-sm-8 col-lg-6">
                                                    <input class="form-control" id="inputReadonly3" type="text" readonly="readonly" value="Readonly input text">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4" for="inputReadonly3">Candidate name</label>
                                                <div class="col-12 col-sm-8 col-lg-6">
                                                    <input class="form-control" id="inputReadonly4" type="text" readonly="readonly" value="Readonly input text">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4" for="inputReadonly3">Schedule Time</label>
                                                <div class="col-12 col-sm-8 col-lg-6">
                                                    <input class="form-control" id="inputReadonly5" type="text" readonly="readonly" value="Readonly input text">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4" for="inputReadonly3">Notes</label>
                                                <div class="col-12 col-sm-8 col-lg-6">
                                                    <input class="form-control" id="inputReadonly7" type="text" readonly="readonly" value="Readonly input text">
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
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4" for="inputReadonly3">Job</label>
                                                <div class="col-12 col-sm-8 col-lg-6">
                                                    <input class="form-control" id="inputReadonly8" type="text" readonly="readonly" value="Readonly input text">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4" for="inputReadonly3">Interviewer</label>
                                                <div class="col-12 col-sm-8 col-lg-6">
                                                    <input class="form-control" id="inputReadonly9" type="text" readonly="readonly" value="Readonly input text">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4" for="inputReadonly3">Location</label>
                                                <div class="col-12 col-sm-8 col-lg-6">
                                                    <input class="form-control" id="inputReadonly10" type="text" readonly="readonly" value="Readonly input text">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4" for="inputReadonly3">Recruiter owner</label>
                                                <div class="col-12 col-sm-8 col-lg-6">
                                                    <input class="form-control" id="inputReadonly11" type="text" readonly="readonly" value="Readonly input text">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4" for="inputReadonly3">Meeting ID</label>
                                                <div class="col-12 col-sm-8 col-lg-6">
                                                    <input class="form-control" id="inputReadonly12" type="text" readonly="readonly" value="Readonly input text">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4" for="inputReadonly3">Result</label>
                                                <div class="col-12 col-sm-8 col-lg-6">
                                                    <input class="form-control" id="inputReadonly13" type="text" readonly="readonly" value="Readonly input text">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-12 col-sm-3 col-form-label text-sm-left mr-4" for="inputReadonly3">Status</label>
                                                <div class="col-12 col-sm-8 col-lg-6">
                                                    <input class="form-control" id="inputReadonly14" type="text" readonly="readonly" value="Readonly input text">
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




    <%@include file="../lay_out/setting.jsp"%>
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

<script src="/js/interview_schedule/details.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        //-initialize the javascript
        App.init();
        App.formElements();
    });
</script>
</body>
</html>