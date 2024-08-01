<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="/css/app.css" type="text/css">
    <title>Update Job</title>
</head>

<body>
<jsp:include page="../layout/header.jsp" />
<jsp:include page="../layout/left-sidebar.jsp" />
<div class="be-content">
    <div class="main-content container-fluid">
        <h1>Job</h1>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/job">Job list</a></li>
                <li class="breadcrumb-item active" aria-current="page">Update job</li>
            </ol>
        </nav>
        <h2>Update job</h2>
        <%--@elvariable id="update" type="" --%>
        <form:form action="/job/update" method="post" modelAttribute="update">
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Id: </label>
                    <form:input type="text" class="form-control" path="jobId" name="jobId"
                                readonly="true" />
                </div>
                <div class="col-md-6">
                    <label class="form-label">Job title</label>
                    <form:input type="text" class="form-control" path="title" name="title"
                                required="true" />
                </div>
            </div>

            <!-- Skills, Benefits, and Levels Dropdowns -->
            <div class="row mb-3">
                <div class="col-md-4">
                    <label for="skills">Skills</label>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button"
                                id="skillsDropdown">
                            Select Skills
                        </button>
                        <div class="dropdown-menu" aria-labelledby="skillsDropdown" id="skillsMenu">
                            <a class="dropdown-item" href="#" data-value="java">Java</a>
                            <a class="dropdown-item" href="#" data-value="nodejs">Node.js</a>
                            <a class="dropdown-item" href="#" data-value="net">.NET</a>
                            <a class="dropdown-item" href="#" data-value="cpp">C++</a>
                            <a class="dropdown-item" href="#"
                               data-value="business-analysis">Business
                                Analysis</a>
                            <a class="dropdown-item" href="#"
                               data-value="communication">Communication</a>
                        </div>
                    </div>
                    <input type="hidden" id="skills" name="requiredSkills">
                    <div id="selectedSkills" class="mt-2"></div>
                </div>
                <div class="col-md-4">
                    <label for="benefits">Benefits</label>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button"
                                id="benefitsDropdown">
                            Select Benefits
                        </button>
                        <div class="dropdown-menu" aria-labelledby="benefitsDropdown"
                             id="benefitsMenu">
                            <a class="dropdown-item" href="#" data-value="lunch">Lunch</a>
                            <a class="dropdown-item" href="#" data-value="leave">25-day leave</a>
                            <a class="dropdown-item" href="#" data-value="healthcare">Healthcare
                                insurance</a>
                            <a class="dropdown-item" href="#" data-value="hybrid">Hybrid working</a>
                            <a class="dropdown-item" href="#" data-value="travel">Travel</a>
                        </div>
                    </div>
                    <input type="hidden" id="benefits" name="benefits">
                    <div id="selectedBenefits" class="mt-2"></div>
                </div>
                <div class="col-md-4">
                    <label for="level">Levels</label>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button"
                                id="levelsDropdown">
                            Select Levels
                        </button>
                        <div class="dropdown-menu" aria-labelledby="levelsDropdown" id="levelsMenu">
                            <a class="dropdown-item" href="#" data-value="fresher">Fresher</a>
                            <a class="dropdown-item" href="#" data-value="junior">Junior</a>
                            <a class="dropdown-item" href="#" data-value="senior">Senior</a>
                            <a class="dropdown-item" href="#" data-value="leader">Leader</a>
                            <a class="dropdown-item" href="#" data-value="manager">Manager</a>
                            <a class="dropdown-item" href="#" data-value="vice-head">Vice Head</a>
                        </div>
                    </div>
                    <input type="hidden" id="level" name="level">
                    <div id="selectedLevels" class="mt-2"></div>
                </div>
            </div>

            <!-- Date -->
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="startDate">Start date</label>
                    <form:input type="datetime-local" class="form-control datepicker"
                                path="startDate" name="startDate" />
                </div>
                <div class="col-md-6">
                    <label for="endDate">End date</label>
                    <form:input type="datetime-local" class="form-control datepicker" path="endDate"
                                name="endDate" />
                </div>
            </div>

            <!-- Salary -->
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="salaryFrom">Salary range from</label>
                    <form:input type="text" class="form-control" path="salaryFrom" name="salaryFrom"
                                oninput="formatSalary(this)" />
                </div>
                <div class="col-md-6">
                    <label for="salaryTo">To</label>
                    <form:input type="text" class="form-control" path="salaryTo" name="salaryTo"
                                oninput="formatSalary(this)" />
                </div>
            </div>

            <!-- Address -->
            <div class="mb-3">
                <label for="location">Working address</label>
                <form:input type="text" class="form-control" path="location" name="location" />
            </div>

            <!-- Description -->
            <div class="mb-3">
                <label for="description">Description</label>
                <form:textarea class="form-control" path="description" name="description"
                               rows="3" />
            </div>

            <button type="submit" class="btn btn-primary">Submit</button>
            <a href="/job" class="btn btn-secondary">Cancel</a>
            <hr>
        </form:form>
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
<script src="/lib/jqvmap/maps/jquery.vmap.world.js" type="text/javascript"></script>1
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<!-- FontAwesome JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<script>
    function initializeDropdown(dropdownId, menuId, selectedId, hiddenFieldId) {
        var dropdown = document.getElementById(dropdownId);
        var menu = document.getElementById(menuId);
        var selectedElement = document.getElementById(selectedId);
        var hiddenField = document.getElementById(hiddenFieldId);

        dropdown.addEventListener('click', function () {
            menu.classList.toggle('show');
        });

        document.querySelectorAll('#' + menuId + ' .dropdown-item').forEach(function (item) {
            item.addEventListener('click', function (event) {
                event.preventDefault();
                var value = this.getAttribute('data-value');
                var text = this.innerText;

                // Check if the item is already selected
                var existingItems = selectedElement.getElementsByClassName('selected-item');
                for (var i = 0; i < existingItems.length; i++) {
                    if (existingItems[i].getAttribute('data-value') === value) {
                        return; // Prevent duplicate selection
                    }
                }

                var element = document.createElement('span');
                element.setAttribute('class', 'selected-item badge badge-primary mr-2');
                element.setAttribute('data-value', value);
                element.innerHTML = text + ' <i class="fas fa-times remove-item"></i>';

                // Add event listener to the 'x' button after creating the element
                element.querySelector('.remove-item').addEventListener('click', function () {
                    this.parentNode.remove();
                    updateHiddenField();
                });

                selectedElement.appendChild(element);
                updateHiddenField();
                menu.classList.remove('show');
            });
        });

        // Logic for removing selected items
        selectedElement.addEventListener('click', function (event) {
            if (event.target.classList.contains('remove-item')) {
                event.target.parentNode.remove();
                updateHiddenField();
            }
        });

        function updateHiddenField() {
            var values = [];
            selectedElement.querySelectorAll('.selected-item').forEach(function (item) {
                values.push(item.getAttribute('data-value'));
            });
            hiddenField.value = values.join(',');
        }
    }

    document.addEventListener('DOMContentLoaded', function () {
            initializeDropdown('skillsDropdown', 'skillsMenu', 'selectedSkills', 'skills');
            initializeDropdown('benefitsDropdown', 'benefitsMenu', 'selectedBenefits', 'benefits');
            initializeDropdown('levelsDropdown', 'levelsMenu', 'selectedLevels', 'level');
        }
    );


    function formatSalary(input) {
        // Remove non-digit characters except for commas
        let value = input.value.replace(/\D/g, '');

        // Format the value with commas as thousand separators
        value = value.replace(/\B(?=(\d{3})+(?!\d))/g, '.');

        // Set the formatted value back to the input
        input.value = value;
    }
</script>
<style>
    .selected-item {
        display: inline-block;
        background-color: #007bff;
        color: #fff;
        padding: 5px 10px;
        margin-right: 5px;
        margin-bottom: 5px;
        border-radius: 20px;
    }

    .remove-item {
        cursor: pointer;
        margin-left: 5px;
        color: #dc3545;
    }
</style>

</body>

</html>