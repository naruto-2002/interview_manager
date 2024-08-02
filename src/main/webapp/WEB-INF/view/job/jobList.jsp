<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job List</title>
    <link rel="stylesheet" type="text/css" href="/lib/perfect-scrollbar/css/perfect-scrollbar.css">
    <link rel="stylesheet" type="text/css" href="/lib/material-design-icons/css/material-design-iconic-font.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="/css/app.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="/css/list.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

</head>

<body>
<% if (request.getAttribute("errorMessage") !=null) { %>
<div class="alert alert-danger">
    <%= request.getAttribute("errorMessage") %>
</div>
<% } %>
<jsp:include page="../layout/header.jsp" />
<jsp:include page="../layout/left-sidebar.jsp" />
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
                        <input class="form-control" type="search" name="keyword"
                               placeholder="Search" aria-label="Search" style="width: 100%;"
                               value="${keyword != null ? keyword : ''}">
                    </div>
                    <div class="col-auto"
                         style="display: flex; align-items: center; margin-right: 10px;">
                        <label for="statusSelect"
                               style="margin-right: 1rem; font-size: 18px;">Status</label>
                        <div class="custom-select-arrow">
                            <select class="form-control" name="status" id="statusSelect"
                                    style="height: 3rem; font-size: 12px;">
                                <option value=""></option>
                                <option value="open" ${status=='OPEN' ? 'selected' : '' }>OPEN
                                </option>
                                <option value="close" ${status=='CLOSE' ? 'selected' : '' }>
                                    CLOSE</option>
                            </select>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-info">Search</button>
                </form>
                <% String alertMessage=(String) request.getAttribute("message"); %>
                <% if (alertMessage !=null) { %>
                <div class="alert alert-info text-center" role="alert">
                    <%= alertMessage %>
                </div>
                <% } %>
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
                <c:choose>
                    <c:when test="${not empty listjobs.content}">
                        <!-- Hiển thị danh sách công việc nếu có dữ liệu -->
                        <c:forEach var="index" begin="0"
                                   end="${listjobs.content.size() -1}">
                            <tr>
                                <td>${listjobs.content[index].title}</td>
                                <td>${listjobs.content[index].requiredSkills}</td>
                                <td>${listjobs.content[index].startDate}</td>
                                <td>${listjobs.content[index].endDate}</td>
                                <td>${listjobs.content[index].level}</td>
                                <td>${listjobs.content[index].status}</td>
                                <td>
                                    <a href="/job/detail/${listjobs.content[index].jobId}"
                                       class="btn btn-success">View</a>
                                    <a href="/job/update/${listjobs.content[index].jobId}"
                                       class="btn btn-warning mx-2">Update</a>
                                    <a href="/job/delete/${listjobs.content[index].jobId}"
                                       class="btn btn-danger">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>

                </c:choose>
                </tbody>





            </table>
            <nav class="pagination-container" aria-label="Page navigation example">
                <ul class="pagination">
                    <c:choose>
                        <c:when test="${listjobs.number > 0}">
                            <li class="page-item"><a class="page-link" href="/job?p=0">First</a>
                            </li>
                        </c:when>
                    </c:choose>
                    <!-- <c:choose>
                                                <c:when test="${listjobs.number > 0}">
                                                    <li class="page-item">
                                                        <a class="page-link"
                                                            href="/job?p=${listjobs.number - 1}">Previous</a>
                                                    </li>
                                                </c:when>
                                            </c:choose> -->

                    <!-- Hiển thị số trang -->
                    <c:choose>
                        <c:when test="${listjobs.totalPages > 0}">
                            <c:forEach var="page" begin="0" end="${listjobs.totalPages - 1}">
                                <c:choose>
                                    <c:when test="${page == listjobs.number}">
                                        <li class="page-item active">
                                            <span class="page-link">${page + 1}</span>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item">
                                            <a class="page-link" href="/job?p=${page}">${page +
                                                    1}</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item disabled">
                                <span class="page-link">No pages available</span>
                            </li>
                        </c:otherwise>
                    </c:choose>


                    <!-- <c:choose>
                                                <c:when test="${listjobs.number < listjobs.totalPages - 1}">
                                                    <li class="page-item">
                                                        <a class="page-link"
                                                            href="/job?p=${listjobs.number + 1}">Next</a>
                                                    </li>
                                                </c:when>
                                            </c:choose> -->
                    <c:choose>
                        <c:when test="${listjobs.number < listjobs.totalPages - 1}">
                            <li class="page-item"><a class="page-link"
                                                     href="/job?p=${listjobs.totalPages - 1}">Last</a></li>
                        </c:when>
                    </c:choose>
                </ul>
            </nav>



        </div>
    </div>
</div>
<script src="/lib/jquery/jquery.min.js" type="text/javascript"></script>
<script src="/lib/perfect-scrollbar/js/perfect-scrollbar.min.js"
        type="text/javascript"></script>
<script src="/lib/bootstrap/dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<script src="/js/app.js" type="text/javascript"></script>
<script src="/lib/jquery.sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
<script src="/lib/countup/countUp.min.js" type="text/javascript"></script>
<script src="/lib/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="/lib/jqvmap/jquery.vmap.min.js" type="text/javascript"></script>
<script src="/lib/jqvmap/maps/jquery.vmap.world.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function(){
        //-initialize the javascript
        App.init();
    });
</script>
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

    .pagination-container {
        position: fixed;
        bottom: 50px;
        left: 0;
        width: 100%;


        padding: 10px;
        z-index: 1000;

        display: flex;
        justify-content: center;

    }
</style>
</body>


</html>