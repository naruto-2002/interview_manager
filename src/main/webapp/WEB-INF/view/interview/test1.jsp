<div class="be-wrapper">
    <%@include file="../layout/header.jsp"%>
    <%@include file="../layout/left-sidebar.jsp"%>

    <div class="be-content">
        <div class="page-head">
            <h2 class="page-head-title">Interview Schedule Details</h2>
        </div>
        <div class="main-content container-fluid">
            <div class="card">
                <div class="card-header">
                    <c:if test="${roleName == 'admin' || roleName == 'manager' || roleName == 'recruiter'}">
                        <a href="/interview/reminder?interviewId=${interview.interviewId}" class="btn btn-secondary">Send Reminder</a>
                    </c:if>
                </div>
                <div class="card-body">
                    <div class="row">
                        <!-- Left Column -->
                        <div class="col-md-6">
                            <div class="info-row">
                                <div class="info-label">Schedule Title:</div>
                                <div class="info-content">${interview.title}</div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Candidate:</div>
                                <div class="info-content">${interview.candidate.name}</div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Schedule Time:</div>
                                <div class="info-content">
                                    ${interview.date}<br>
                                    From: ${interview.startTime} To: ${interview.endTime}
                                </div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Notes:</div>
                                <div class="info-content">${interview.note}</div>
                            </div>
                        </div>
                        <!-- Right Column -->
                        <div class="col-md-6">
                            <div class="info-row">
                                <div class="info-label">Job:</div>
                                <div class="info-content">${interview.job.title}</div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Interviewer:</div>
                                <div class="info-content">
                                    <c:forEach var="scheduleInterview" items="${interview.scheduledInterviews}">
                                        <div class="interviewer-item">
                                                ${scheduleInterview.interviewer.fullName} | ${scheduleInterview.interviewer.department}
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Location:</div>
                                <div class="info-content">${interview.location}</div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Recruiter Owner:</div>
                                <div class="info-content">${interview.recruiter.fullName} | ${interview.recruiter.department}</div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Meeting ID:</div>
                                <div class="info-content">${interview.meetingId}</div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Result:</div>
                                <div class="info-content">${interview.result.name().toString()}</div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Status:</div>
                                <div class="info-content">${interview.status.name().toString()}</div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 text-center">
                            <a href="/interview/list" class="btn btn-secondary">Close</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .info-row {
        display: flex;
        align-items: center;
        margin-bottom: 15px; /* Increased space between rows */
    }
    .info-label {
        font-weight: bold;
        margin-right: 20px; /* Increased space between label and content */
        width: 200px; /* Adjust width if needed */
        flex-shrink: 0;
        font-size: 16px; /* Increased font size for better readability */
        color: #333;
    }
    .info-content {
        flex: 1;
        font-size: 16px; /* Increased font size for better readability */
        color: #555;
    }
    .interviewer-item {
        margin-bottom: 8px; /* Reduced space between interviewer items */
    }
    .btn-secondary {
        background-color: #6c757d;
        color: #fff;
        border: none;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 4px;
        font-size: 16px; /* Increased button font size */
    }
    .btn-secondary:hover {
        background-color: #5a6268;
    }
</style>
