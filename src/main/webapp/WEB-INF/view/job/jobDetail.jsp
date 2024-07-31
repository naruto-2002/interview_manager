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
            <jsp:include page="../layout/header.jsp"/>
            <jsp:include page="../layout/left-sidebar.jsp"/>
                <div class="be-content mt-5">1
                    <div class="main-content container-fluid">
                        <div class="col-12 mx-auto">
                            <div class="d-flex justify-content-between">
                                <h3>Job Detail ${jobdetail.jobId}</h3>
                            </div>

                            <hr />
                            <div class="card" style="width: 60%;">
                                <div class="card-header">
                                    Job information
                                </div>

                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Attribute</th>
                                            <th scope="col">Value</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Id</td>
                                            <td>${jobdetail.jobId}</td>
                                        </tr>
                                        <tr>
                                            <td>Benefits</td>
                                            <td>${jobdetail.benefits}</td>
                                        </tr>
                                        <tr>
                                            <td>Description</td>
                                            <td>${jobdetail.description}</td>
                                        </tr>
                                        <tr>
                                            <td>Start Date</td>
                                            <td>${jobdetail.startDate}</td>
                                        </tr>
                                        <tr>
                                            <td>End Date</td>
                                            <td>${jobdetail.endDate}</td>
                                        </tr>
                                        <tr>
                                            <td>Level</td>
                                            <td>${jobdetail.level}</td>
                                        </tr>
                                        <tr>
                                            <td>Location</td>
                                            <td>${jobdetail.location}</td>
                                        </tr>
                                        <tr>
                                            <td>Required Skills</td>
                                            <td>${jobdetail.requiredSkills}</td>
                                        </tr>
                                        <tr>
                                            <td>Title</td>
                                            <td>${jobdetail.title}</td>
                                        </tr>
                                        <tr>
                                            <td>Status</td>
                                            <td>${jobdetail.status}</td>
                                        </tr>
                                        <tr>
                                            <td>Salary From</td>
                                            <td>${jobdetail.salaryFrom}</td>
                                        </tr>
                                        <tr>
                                            <td>Salary To</td>
                                            <td>${jobdetail.salaryTo}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>


                        </div>

                    </div>
                    <hr>
                    <div class="btn-container">
                        <a href="/job" class="btn btn-success">Back</a>
                        <a href="/job/update/${jobdetail.jobId}" class="btn btn-warning">Edit</a>
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