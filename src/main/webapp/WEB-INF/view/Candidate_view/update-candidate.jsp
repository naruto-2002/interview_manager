<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="org.springframework.expression.spel.support.StandardEvaluationContext" %>
<%@ page import="org.springframework.expression.ExpressionParser" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="assets\img\logo-fav.png">
    <title>Beagle</title>
    <link rel="stylesheet" type="text/css" href="assets\lib\perfect-scrollbar\css\perfect-scrollbar.css">
    <link rel="stylesheet" type="text/css"
          href="\lib\material-design-icons\css\material-design-iconic-font.min.css">
    <link rel="stylesheet" type="text/css"
          href="\lib\datatables\datatables.net-bs4\css\dataTables.bootstrap4.css">
    <link rel="stylesheet" type="text/css"
          href="\lib\datatables\datatables.net-responsive-bs4\css\responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="\css\app.css" type="text/css">
    <link rel="stylesheet" href="\css\virtual-select.min.css" type="text/css">
    <style>
        .vscomp-toggle-button {
            box-shadow: none;
            border: none;
        }
    </style>
</head>

<body>
<jsp:include page="../layout/header.jsp"/>
<jsp:include page="../layout/left-sidebar.jsp"/>
<div class="be-content">
    <div class="container">
        <h1>User Registration</h1>
        <%--@elvariable id="candidate" type=""--%>
        <form:form action="/updateCandidate?id=${candidate.id}" method="post" modelAttribute="candidate" id="form">
            <div class="row">

                <div class="col-md-6">
                    <div class="form-group">
                        <label >Full Name:</label>
                        <input type="text" class="form-control" name="name" value="${candidate.name}"   required/>
                    </div>
                    <div class="form-group">
                        <label for="dob">Date of Birth:</label>
                        <form:input type="date" class="form-control" path="dob"/>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone Number:</label>
                        <form:input type="tel" class="form-control" path="phone" placeholder="Enter your phone number"/>
                    </div>
                    <div class="form-group">
                        <label for="cvAttachmentLink">File CV:</label>
                        <form:input type="file" class="form-control" path="cvAttachmentLink"/>
                    </div>
                    <div class="form-group">
                        <label >CurrentPosition:</label><br>
                        <form:select class="" path="currentPosition" id="position">
                            <form:option value="">Select </form:option>
                            <form:options items="${position}" />
                        </form:select>
                    </div>
                    <div class="form-group">
                        <label >Skill:</label><br>
                        <select multiple name="skills" placeholder="Skill" data-search="false" data-silent-initial-value-set="true" id="skill">
                            <option value="Java" ${fn:contains(candidate.skills, 'Java') ? 'selected' : ''}>Java</option>
                            <option value="Nodejs" ${fn:contains(candidate.skills, 'Nodejs') ? 'selected' : ''}>Nodejs</option>
                            <option value=".net" ${fn:contains(candidate.skills, '.net') ? 'selected' : ''}>.NET</option>
                            <option value="C++" ${fn:contains(candidate.skills, 'C++') ? 'selected' : ''}>C++</option>
                            <option value="Business analysis" ${fn:contains(candidate.skills, 'Business analysis') ? 'selected' : ''}>Business analysis</option>
                            <option value="Communication" ${fn:contains(candidate.skills, 'Communication') ? 'selected' : ''}>Communication</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Recruiter:</label><br>
                        <form:select path="user" id="recruiter">
                            <form:option value="" selected="true">Choose Recruiter</form:option>
                            <form:options items="${recruiters}" itemValue="id" itemLabel="fullName"  />

                        </form:select>
                        <form:errors path="user" cssClass="text-danger"></form:errors>
                    </div>


                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" name="email" id="email" value="${candidate.email}" required/>
                    </div>
                    <div class="form-group">
                        <label for="address">Address:</label>
                        <form:input type="text" class="form-control" path="address"/>
                    </div>
                    <div class="form-group">
                        <label >Gender:</label><br>
                        <form:select class="form-control" path="gender" id="gender">
                            <form:option value="">Select </form:option>
                            <form:options items="${gender}" />
                        </form:select>
                    </div>

                    <div class="form-group">
                        <label for="note">Note:</label>
                        <form:input class="form-control" path="note"/>
                    </div>
                    <div class="form-group">
                        <label >Status:</label><br>
                        <form:select class="" path="status" id="status">
                            <form:option value="">Select </form:option>
                            <form:options items="${status}" />
                        </form:select>
                    </div>
                    <div class="form-group">
                        <label for="yearsExperience">Year of Experience:</label>
                        <form:input class="form-control" path="yearsExperience"/>
                    </div>
                    <div class="form-group">
                        <label >Highest Level:</label><br>
                        <form:select class="" path="highestLevel" id="highestlevel">
                            <form:option value="">Select </form:option>
                            <form:options items="${highlevel}" />
                        </form:select>
                    </div>
                </div>
            </div>



            <div class="row">
                <div class="col-md-12">
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="button" class="btn btn-secondary">Cancel</button>
                </div>
            </div>
        </form:form>
    </div>
</div>

</div>
<div class="be-right-sidebar">
    <!-- Right sidebar -->
</div>
</div>
<script src="assets\js\virtual-select.min.js"></script>
<script>
    VirtualSelect.init({
        ele: 'select'
    });

</script>
<script>
    var form= document.getElementById('form')
    console.log(form)

    form.addEventListener('submit', (event) => {
        // Kiểm tra các trường bắt buộc
        const position = document.getElementById('position');
        const skill= document.getElementById('skill');
        const gender= document.getElementById('gender');
        const recruiter= document.getElementById('recruiter');
        const status = document.getElementById('status');
        const highlevel = document.getElementById('highestlevel');
        if(position.value===""||status.value==""||skill.value==""||gender.value==""||recruiter.value==""||highlevel.value=="") {
            alert("Please select ")
            event.preventDefault();
        }




    });
</script>
</body>