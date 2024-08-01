<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Update Offer</title>
    <link rel="stylesheet" type="text/css" href="/lib/perfect-scrollbar/css/perfect-scrollbar.css">
    <link rel="stylesheet" type="text/css" href="/lib/material-design-icons/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" type="text/css" href="/lib/datatables/datatables.net-bs4/css/dataTables.bootstrap4.css">
    <link rel="stylesheet" type="text/css"
          href="/lib/datatables/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="/css/app.css" type="text/css">
    <style>
        .error-input {
            border-color: red;
        }

        .error-message {
            color: red;
            font-size: 0.875em;
            display: none;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp"/>
<jsp:include page="../layout/left-sidebar.jsp"/>

<div class="be-content" style="margin-top: 60px;">
    <div class="main-content container-fluid">
        <div class="page-head mt-0 px-0" style="margin-top: 60px;">
            <h2 class="page-head-title">Update Offer</h2>
            <nav aria-label="breadcrumb mt-2" role="navigation">
                <ol class="breadcrumb page-head-nav">
                    <li class="breadcrumb-item"><a href="/offers">Offer List</a></li>
                    <li class="breadcrumb-item active">Update Offer</li>
                </ol>
            </nav>
        </div>

        <div class="">

            <form:form action="${pageContext.request.contextPath}/offers/${offer.offerId}" method="post"
                       modelAttribute="offer" onsubmit="return validateForm();">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="candidate">Candidate:</label>
                            <form:select path="candidate.id" class="form-control" id="candidate" required="true">
                                <form:options items="${candidates}" itemValue="id" itemLabel="name"/>
                            </form:select>
                        </div>
                        <div class="form-group">
                            <label for="position">Position:</label>
                            <form:select path="position" class="form-control" id="position">
                                <form:options items="${positions}"/>
                            </form:select>
                        </div>
                        <div class="form-group">
                            <label for="manager">Approved by:</label>
                            <form:select path="approver" class="form-control" id="manager" required="true">
                                <form:option value="" label="Select Manager"/>
                                <form:options items="${managers}" itemValue="userId" itemLabel="fullName"/>
                            </form:select>
                        </div>
                        <div class="form-group">
                            <label for="interview">Interview Schedule:</label>
                            <form:select path="interview.interviewId" class="form-control"
                                         id="interview"
                                         required="true">
                                <form:option value="" label="Select Interview"/>
                                <form:options items="${interviews}" itemValue="interviewId"
                                              itemLabel="title"/>
                            </form:select>
                        </div>
                        <div class="form-group">
                            <label>Start Contract:</label>
                            <div class="row">
                                <div class="col-md-6">
                                    <form:input path="startContract" class="form-control" id="startContract"
                                                type="date"/>
                                    <span id="startContractError" class="error-message">Start date must be before end date.</span>

                                    <!-- Hiển thị lỗi cho trường startContract -->
                                    <form:errors path="startContract" cssClass="error"/>
                                </div>
                                <div class="col-md-6">
                                    <form:input path="endContract" class="form-control" id="endContract" type="date"/>
                                    <!-- Hiển thị lỗi cho trường startContract -->
                                    <span id="endContractError"
                                          class="error-message">End date must be after start date.</span>
                                    <form:errors path="endContract" cssClass="error"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="dueDate">Due Date:</label>
                            <form:input path="dueDate" class="form-control" id="dueDate" type="date"/>
                            <form:errors path="dueDate" cssClass="error"/>
                        </div>
                        <div class="form-group">
                            <label for="status">Status:</label>
                            <p>${offer.status}</p>
                            <form:select path="status" class="form-control" id="status">
                                <form:options items="${statuses}"/>
                            </form:select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="contractType">Contract Type:</label>
                            <form:select path="contractType" class="form-control" id="contractType">
                                <form:options items="${contractTypes}"/>
                            </form:select>
                        </div>
                        <div class="form-group">
                            <label for="level">Level:</label>
                            <form:select path="level" class="form-control" id="level">
                                <form:options items="${levels}"/>
                            </form:select>
                        </div>
                        <div class="form-group">
                            <label for="department">Department:</label>
                            <form:select path="department" class="form-control" id="department">
                                <form:options items="${departments}"/>
                            </form:select>
                        </div>
                        <div class="form-group">
                            <label for="recruiter">Recruiter:</label>
                            <form:select path="recruiter" class="form-control" id="recruiter" required="true">
                                <form:option value="" label="Select Recruiter"/>
                                <form:options items="${recruiters}" itemValue="userId"
                                              itemLabel="fullNameWithAccountName"/>
                            </form:select>
                        </div>
                        <div class="form-group">
                            <label for="basicSalary">Basic Salary:</label>
                            <form:input path="basicSalary" class="form-control" id="basicSalary"/>
                        </div>
                        <div class="form-group">
                            <label for="note">Note:</label>
                            <form:textarea class="form-control" path="note" id="note" maxlength="500" rows="4"
                                           cols="50"/>
                        </div>
                    </div>
                </div>

                <div class="row d-f justify-content-center">
                    <button class="btn btn-info p-2 px-6 text-center" type="submit">Update</button>
                    <span class="m-2"></span>
                    <button type="button" class="btn btn-secondary p-2 px-6 text-center"
                            onclick="window.history.back();">Cancel
                    </button>
                </div>
            </form:form>
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
<!-- Các script khác của bạn -->
<script>
    function validateForm(event) {
        var startContract = document.getElementById("startContract").value;
        var endContract = document.getElementById("endContract").value;

        if (startContract !== "" && endContract !== "") {
            var startDate = new Date(startContract);
            var endDate = new Date(endContract);

            if (startDate > endDate) {
                event.preventDefault();
                document.getElementById("startContractError").style.display = "block";
                document.getElementById("endContractError").style.display = "none";
                return false;
            } else if (startDate < endDate) {
                document.getElementById("startContractError").style.display = "none";
                document.getElementById("endContractError").style.display = "none";
            } else {
                // Ngày bắt đầu và ngày kết thúc trùng nhau
                document.getElementById("startContractError").style.display = "none";
                document.getElementById("endContractError").style.display = "none";
            }
        }

        return true;
    }

</script>
</body>
</html>
