window.onload = function() {
    var htmls1 = '<div style="margin-right: 10px" class="icon"><span class="mdi mdi-minus-circle-outline"></span></div>';
    document.querySelectorAll(".ms-elem-selection").forEach(function(element) {
        element.insertAdjacentHTML("afterbegin", htmls1);
    })
    var htmls2 = '<div style="margin-right: 10px" class="icon"><span class="mdi mdi-plus-circle-o"></span></div>';
    document.querySelectorAll(".ms-elem-selectable").forEach(function(element) {
        element.insertAdjacentHTML("afterbegin", htmls2);
    })
}
function updateCandidateInfo() {
    var select = document.getElementById("candidate");
    var selectedOption = select.options[select.selectedIndex];

    var dob = selectedOption.getAttribute("data-dob");
    var address = selectedOption.getAttribute("data-address");
    var email = selectedOption.getAttribute("data-email");
    var phoneNumber = selectedOption.getAttribute("data-phone-number");
    var skill = selectedOption.getAttribute("data-skill");
    var position = selectedOption.getAttribute("data-position");


    document.getElementById("candidate-dob").textContent = dob;
    document.getElementById("candidate-address").textContent = address;
    document.getElementById("candidate-email").textContent = email;
    document.getElementById("candidate-phone-number").textContent = phoneNumber;
    document.getElementById("candidate-skill").textContent = skill;
    document.getElementById("candidate-position").textContent = position;
}

function updateJobInfo() {
    var select = document.getElementById("job");
    var selectedOption = select.options[select.selectedIndex];

    var location = selectedOption.getAttribute("data-location");
    var workingAddress = selectedOption.getAttribute("data-working-address");
    var levels = selectedOption.getAttribute("data-levels");
    var status = selectedOption.getAttribute("data-status");

    document.getElementById("job-location").textContent = location;
    document.getElementById("job-working-address").textContent = workingAddress;
    document.getElementById("job-levels").textContent = levels;
    document.getElementById("job-status").textContent = status;
}

function updateRecruiterInfo() {
    var select = document.getElementById("recruiter");
    var selectedOption = select.options[select.selectedIndex];

    var dob = selectedOption.getAttribute("data-dob");
    var address = selectedOption.getAttribute("data-address");
    var email = selectedOption.getAttribute("data-email");
    var phone = selectedOption.getAttribute("data-phone");
    var department = selectedOption.getAttribute("data-department");

    document.getElementById("recruiter-dob").textContent = dob;
    document.getElementById("recruiter-address").textContent = address;
    document.getElementById("recruiter-email").textContent = email;
    document.getElementById("recruiter-phone").textContent = phone;
    document.getElementById("recruiter-department").textContent = department;
}

updateCandidateInfo();
updateJobInfo();
updateRecruiterInfo()