<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="/css/app.css" type="text/css">
    <title>Create Job</title>
</head>

<body>

<jsp:include page="../layout/header.jsp"/>
<jsp:include page="../layout/left-sidebar.jsp"/>
<div class="be-content">
    <div class="main-content container-fluid">
        <h1>Job</h1>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/job">Job list</a></li>
                <li class="breadcrumb-item active" aria-current="page">Create job</li>
            </ol>
        </nav>
        <h2>Create job</h2>
        <form action="/job/create" method="post">
            <div class="form-group">
                <label for="title">Job title</label>
                <input type="text" class="form-control" id="title" name="title" required>
            </div>
            <!-- Skills Dropdown -->
            <div class="form-group">
                <label for="skills">Skills</label>
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="skillsDropdown">
                        Select Skills
                    </button>
                    <div class="dropdown-menu" aria-labelledby="skillsDropdown" id="skillsMenu">
                        <a class="dropdown-item" href="#" data-value="java">Java</a>
                        <a class="dropdown-item" href="#" data-value="nodejs">Node.js</a>
                        <a class="dropdown-item" href="#" data-value="net">.NET</a>
                        <a class="dropdown-item" href="#" data-value="cpp">C++</a>
                        <a class="dropdown-item" href="#" data-value="business-analysis">Business Analysis</a>
                        <a class="dropdown-item" href="#" data-value="communication">Communication</a>
                    </div>
                </div>
                <input type="hidden" id="skills" name="requiredSkills">
                <div id="selectedSkills" class="mt-2"></div>
            </div>

            <!-- Date -->
            <div class="form-group" style="width: 50%;">
                <label for="startDate">Start date</label>
                <input type="datetime-local" class="form-control datepicker" id="startDate" name="startDate" required>
            </div>
            <div class="form-group" style="width: 50%;">
                <label for="endDate">End date</label>
                <input type="datetime-local" class="form-control datepicker" id="endDate" name="endDate" required>
            </div>
            <!-- Salary -->
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="salaryFrom">Salary range from</label>
                    <input type="text" class="form-control" id="salaryFrom" name="salaryFrom"
                           oninput="formatSalary(this)">
                </div>
                <div class="form-group col-md-6">
                    <label for="salaryTo">To</label>
                    <input type="text" class="form-control" id="salaryTo" name="salaryTo" oninput="formatSalary(this)"
                           required>
                </div>
            </div>
            <!-- Address -->
            <div class="form-group">
                <label for="location">Working address</label>
                <input type="text" class="form-control" id="location" name="location">
            </div>
            <!-- Benefits Dropdown -->
            <div class="form-group">
                <label for="benefits">Benefits</label>
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="benefitsDropdown">
                        Select Benefits
                    </button>
                    <div class="dropdown-menu" aria-labelledby="benefitsDropdown" id="benefitsMenu">
                        <a class="dropdown-item" href="#" data-value="lunch">Lunch</a>
                        <a class="dropdown-item" href="#" data-value="leave">25-day leave</a>
                        <a class="dropdown-item" href="#" data-value="healthcare">Healthcare insurance</a>
                        <a class="dropdown-item" href="#" data-value="hybrid">Hybrid working</a>
                        <a class="dropdown-item" href="#" data-value="travel">Travel</a>
                    </div>
                </div>
                <input type="hidden" id="benefits" name="benefits">
                <div id="selectedBenefits" class="mt-2"></div>
            </div>

            <!-- Levels Dropdown -->
            <div class="form-group">
                <label for="levels">Levels</label>
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="levelsDropdown">
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
            <!-- Description -->
            <div class="form-group">
                <label for="description">Description</label>
                <textarea class="form-control" id="description" name="description" rows="3"></textarea>
            </div>

            <button type="submit" class="btn btn-primary">Submit</button>
            <a href="/job" class="btn btn-secondary">Cancel</a>
            <hr>
        </form>
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
    });

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