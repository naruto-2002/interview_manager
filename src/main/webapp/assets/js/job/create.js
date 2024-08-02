
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

            var existingItems = selectedElement.getElementsByClassName('selected-item');
            for (var i = 0; i < existingItems.length; i++) {
                if (existingItems[i].getAttribute('data-value') === value) {
                    return;
                }
            }

            var element = document.createElement('span');
            element.setAttribute('class', 'selected-item badge badge-primary mr-2');
            element.setAttribute('data-value', value);
            element.innerHTML = text + ' <i class="fas fa-times remove-item"></i>';

            element.querySelector('.remove-item').addEventListener('click', function () {
                this.parentNode.remove();
                updateHiddenField();
            });

            selectedElement.appendChild(element);
            updateHiddenField();
            menu.classList.remove('show');
        });
    });

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
    let value = input.value.replace(/\D/g, '');
    value = value.replace(/\B(?=(\d{3})+(?!\d))/g, '.');
    input.value = value;
}

