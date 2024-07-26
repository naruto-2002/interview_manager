// skill 
var skillsDropdown = document.getElementById('skillsDropdown');
var skillsMenu = document.getElementById('skillsMenu');

skillsDropdown.addEventListener('click', function () {
    skillsMenu.classList.toggle('show');
});

document.querySelectorAll('.dropdown-item').forEach(function (item) {
    item.addEventListener('click', function (event) {
        event.preventDefault();
        var value = this.getAttribute('data-value');
        var text = this.innerText;
        var selectedSkills = document.getElementById('selectedSkills');
        var skillElement = document.createElement('span');
        skillElement.setAttribute('class', 'badge badge-primary mr-2');
        skillElement.innerHTML = text + ' <i class="fas fa-times"></i>';
        skillElement.querySelector('i').addEventListener('click', function () {
            this.parentNode.remove();
        });
        selectedSkills.appendChild(skillElement);
        skillsMenu.classList.remove('show');
    });
});
// benefits 

var benefitsDropdown = document.getElementById('benefitsDropdown');
var benefitsMenu = document.getElementById('benefitsMenu');

benefitsDropdown.addEventListener('click', function () {
    benefitsMenu.classList.toggle('show');
});

document.querySelectorAll('#benefitsMenu .dropdown-item').forEach(function (item) {
    item.addEventListener('click', function (event) {
        event.preventDefault();
        var value = this.getAttribute('data-value');
        var text = this.innerText;
        var selectedBenefits = document.getElementById('selectedBenefits');
        var benefitElement = document.createElement('span');
        benefitElement.setAttribute('class', 'badge badge-primary mr-2');
        benefitElement.innerHTML = text + ' <i class="fas fa-times"></i>';
        benefitElement.querySelector('i').addEventListener('click', function () {
            this.parentNode.remove();
        });
        selectedBenefits.appendChild(benefitElement);
        benefitsMenu.classList.remove('show');
    });
});
// level

var levelsDropdown = document.getElementById('levelsDropdown');
var levelsMenu = document.getElementById('levelsMenu');

levelsDropdown.addEventListener('click', function () {
    levelsMenu.classList.toggle('show');
});

document.querySelectorAll('#levelsMenu .dropdown-item').forEach(function (item) {
    item.addEventListener('click', function (event) {
        event.preventDefault();
        var value = this.getAttribute('data-value');
        var text = this.innerText;
        var selectedLevels = document.getElementById('selectedLevels');
        var levelElement = document.createElement('span');
        levelElement.setAttribute('class', 'badge badge-primary mr-2');
        levelElement.innerHTML = text + ' <i class="fas fa-times"></i>';
        levelElement.querySelector('i').addEventListener('click', function () {
            this.parentNode.remove();
        });
        selectedLevels.appendChild(levelElement);
        levelsMenu.classList.remove('show');
    });
});
