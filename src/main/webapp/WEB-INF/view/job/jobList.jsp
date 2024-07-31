<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Job List</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <link rel="stylesheet" type="text/css" href="/css/jobListCss.css">
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
                <link rel="stylesheet" href="/css/app.css" type="text/css">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            </head>

            <body>
            <jsp:include page="../layout/header.jsp"/>
            <jsp:include page="../layout/left-sidebar.jsp"/>
                <div class="be-content mt-5">
                    <div class="main-content container-fluid">
                        <div class="col-12 mx-auto">
                            <div class="d-flex justify-content-between align-items-center">
                                <h3>Job List</h3>
                                <div>
                                    <a href="/job/import" class="btn btn-primary">Import</a>

                                    <a href="/job/create" class="btn btn-primary">Create a user</a>
                                </div>
                            </div>
                            <div class="container mt-2">
                                <form action="/job" method="GET" style="display: flex; align-items: center;">
                                    <div class="search-box" style="flex: 0 0 50%; margin-right: 10px;">
                                        <input class="form-control" type="search" name="keyword" placeholder="Search"
                                            aria-label="Search" style="width: 100%;">
                                    </div>
                                    <div class="col-auto"
                                        style="display: flex; align-items: center; margin-right: 10px;">
                                        <label for="statusSelect"
                                            style="margin-right: 1rem; font-size: 18px;">Status</label>
                                        <div class="custom-select-arrow">
                                            <select class="form-control" name="status" id="statusSelect"
                                                style="height: 2rem; font-size: 12px;">
                                                <option value=""></option>
                                                <option value="open">Open</option>
                                                <option value="close">Close</option>
                                            </select>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-info">Search</button>
                                </form>
                            </div>
                            <hr />
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Job Title</th>
                                        <th>Required Skills</th>
                                        <th>Start date</th>
                                        <th>End date</th>
                                        <th>Level</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="job" items="${listjobs.content}">
                                        <tr>
                                            <td>${job.title}</td>
                                            <td>${job.requiredSkills}</td>
                                            <td>${job.startDate}</td>
                                            <td>${job.endDate}</td>
                                            <td>${job.level}</td>
                                            <td>${job.status}</td>
                                            <td>
                                                <a href="/job/detail/${job.jobId}"
                                                    class="btn btn-success">View</a>
                                                <a href="/job/update/${job.jobId}"
                                                    class="btn btn-warning mx-2">Update</a>
                                                <a href="/job/delete/${job.jobId}"
                                                    class="btn btn-danger">Delete</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <li class="page-item"><a class="page-link" href="/job?p=0">First</a></li>
                                    <li class="page-item">
                                        <c:choose>
                                            <c:when test="${listjobs.number == 0}">
                                                <a class="page-link" href="#"
                                                    onclick="alert('Đây là trang đầu tiên'); return false;">Previous</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a class="page-link"
                                                    href="/job?p=${listjobs.number - 1}">Previous</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </li>
                                    <li class="page-item">
                                        <c:choose>
                                            <c:when test="${listjobs.number == listjobs.totalPages - 1}">
                                                <a class="page-link" href="#"
                                                    onclick="alert('Đây là trang cuối cùng'); return false;">Next</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a class="page-link"
                                                    href="/job?p=${listjobs.number + 1}">Next</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </li>
                                    <li class="page-item"><a class="page-link"
                                            href="/job?p=${listjobs.totalPages - 1}">Last</a></li>
                                </ul>
                            </nav>

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
                .search-box {
                    position: relative;
                    width: 50%;
                    /* Adjust width as needed */
                }

                .search-box input {
                    width: 100%;
                    padding-left: 2.5rem;
                    /* Make space for the icon */
                }

                .search-box .fa-search {
                    position: absolute;
                    left: 10px;
                    top: 50%;
                    transform: translateY(-50%);
                    color: #aaa;
                }

                .custom-select-arrow {
                    position: relative;
                    display: inline-block;
                    width: 100%;
                }

                .custom-select-arrow select {
                    appearance: none;
                    -webkit-appearance: none;
                    -moz-appearance: none;
                    width: 100%;
                    padding-right: 2rem;
                    /* Adjust padding to make space for the arrow */
                }

                .custom-select-arrow::after {
                    content: '▼';
                    /* Unicode for down arrow */
                    position: absolute;
                    right: 10px;
                    top: 50%;
                    transform: translateY(-50%);
                    pointer-events: none;
                    font-size: 12px;
                }
            </style>

            </html>