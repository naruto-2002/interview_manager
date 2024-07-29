<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit Offer</title>
    <link rel="stylesheet" type="text/css" href="/lib/perfect-scrollbar/css/perfect-scrollbar.css">
    <link rel="stylesheet" type="text/css" href="/lib/material-design-icons/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" type="text/css" href="/lib/datatables/datatables.net-bs4/css/dataTables.bootstrap4.css">
    <link rel="stylesheet" type="text/css"
          href="/lib/datatables/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="/css/app.css" type="text/css">
    <script type="text/javascript">
        function Cancel(visual, edit) {
            var v = document.getElementById(visual);
            var e = document.getElementById(edit);

            v.style.display = "block";
            e.style.display = "none";

            return false;
        }

        function updateInterviewers() {
            var selectedSchedule = document.getElementById("scheduledInterview").value;
            var interviewers = document.getElementById("interviewers");

            interviewers.innerHTML = "";

            var schedules = ${scheduledInterviews};
            for (var i = 0; i < schedules.length; i++) {
                if (schedules[i].scheduledInterviewId == selectedSchedule) {
                    var interviewer = schedules[i].interviewer;
                    var li = document.createElement("li");
                    li.innerHTML = interviewer.fullName;
                    interviewers.appendChild(li);
                }
            }
        }

        function cancelEdit() {
            window.location.href = "/offers";
        }
    </script>
</head>
<body>

<jsp:include page="../layout/header.jsp"/>
<jsp:include page="../layout/left-sidebar.jsp"/>


<div class="be-content" style="margin-top: 60px;">
    <div class="main-content container-fluid">
        <div class="page-head" style="margin-top: 60px;" style="margin-top: 60px;">
            <h2 class="page-head-title">Offer</h2>
            <nav aria-label="breadcrumb mt-2" role="navigation">
                <ol class="breadcrumb page-head-nav">
                    <li class="breadcrumb-item"><a href="/offers">Offer List</a></li>
                    <li class="breadcrumb-item active">Update Offer</li>
                </ol>
            </nav>
        </div>

        <div class="">
            <h1>Offer Update</h1>
            <form:form action="${pageContext.request.contextPath}/offers/${offer.offerId}" method="post"
                       modelAttribute="offer">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="candidate">Candidate:</label>
                            <form:select path="candidate.candidateId" class="form-control" id="candidate"
                                         required="true">
                                <option value="" selected>Select a candidate</option>
                                <form:options items="${candidates}" itemValue="candidateId"
                                              itemLabel="fullName"/>
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
                            <label for="scheduledInterview">Interview Schedule:</label>
                            <form:select path="scheduledInterview.scheduledInterviewId" class="form-control"
                                         id="scheduledInterview"
                                         required="true"
                                         onchange="updateInterviewers()">
                                <form:option value="" label="Select Interview Schedule"/>
                                <form:options items="${scheduledInterviews}" itemValue="scheduledInterviewId"
                                              itemLabel="interview.title"/>
                            </form:select>
                        </div>
                        <div class="form-group">
                            <label>Start Contract:</label>
                            <div class="row">
                                <div class="col-md-6">
                                    From
                                    <form:input path="startContract" class="form-control" id="startContract"
                                                type="date"/>
                                </div>
                                <div class="col-md-6">
                                    To
                                    <form:input path="endContract" class="form-control" id="endContract" type="date"/>
                                </div>
                            </div>

                        </div>

                        <div class="form-group">
                            <label for="dueDate">Due Date:</label>
                            <form:input path="dueDate" class="form-control" id="dueDate" type="date"/>
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
                            <label for="status">Status:</label>
                            <form:select path="status" class="form-control" id="status">
                                <form:options items="${statuses}"/>
                            </form:select>
                        </div>

                        <div class="form-group">
                            <label for="note">Note:</label>
                            <form:textarea class="form-control" path="note" id="note" maxlength="500" rows="4"
                                           cols="50"/>
                        </div>
                    </div>
                </div>

                <div class="row d-f justify-content-center">
                    <button class="btn btn-info p-2 px-6 text-center" type="submit">Submit</button>
                    <span class="m-2"></span>
                    <button type="button" class="btn btn-secondary p-2 px-6 text-center"
                            onclick="window.history.back();">Cancel
                    </button>
                </div>

            </form:form>

        </div>

    </div>
</div>

<%--form--%>
<script src="\lib\jquery\jquery.min.js" type="text/javascript"></script>
<script src="\lib\perfect-scrollbar\js\perfect-scrollbar.min.js" type="text/javascript"></script>
<script src="\lib\bootstrap\dist\js\bootstrap.bundle.min.js" type="text/javascript"></script>
<script src="\js\app.js" type="text/javascript"></script>
<script src="\lib\jquery.sparkline\jquery.sparkline.min.js" type="text/javascript"></script>
<script src="\lib\countup\countUp.min.js" type="text/javascript"></script>
<script src="\lib\jquery-ui\jquery-ui.min.js" type="text/javascript"></script>
<script src="\lib\jqvmap\jquery.vmap.min.js" type="text/javascript"></script>
<script src="\lib\jqvmap\maps\jquery.vmap.world.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        //-initialize the javascript
        App.init();
        App.dashboard();

    });
</script>
</body>
</html>
