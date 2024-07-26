<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Offer</title>
</head>
<body>
<h2>Create Offer</h2>
<form action="${pageContext.request.contextPath}/offers" method="post">
    <label for="basicSalary">Basic Salary:</label>
    <input type="text" id="basicSalary" name="basicSalary" value="${offer.basicSalary}" required><br>

    <label for="dueDate">Due Date:</label>
    <input type="date" id="dueDate" name="dueDate" value="${offer.dueDate}" required><br>

    <label for="startContract">Start Contract:</label>
    <input type="date" id="startContract" name="startContract" value="${offer.startContract}" required><br>

    <label for="endContract">End Contract:</label>
    <input type="date" id="endContract" name="endContract" value="${offer.endContract}" required><br>

    <label for="note">Note:</label>
    <textarea id="note" name="note">${offer.note}</textarea><br>

    <button type="submit">Save</button>
</form>
<a href="${pageContext.request.contextPath}/offers">Back to List</a>
</body>
</html>
