<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Offer Details</title>
</head>
<body>
<h2>Offer Details</h2>
<p>ID: ${offer.offerId}</p>
<p>Basic Salary: ${offer.basicSalary}</p>
<p>Due Date: ${offer.dueDate}</p>
<p>Start Contract: ${offer.startContract}</p>
<p>End Contract: ${offer.endContract}</p>
<p>Note: ${offer.note}</p>
<a href="${pageContext.request.contextPath}/offers">Back to List</a>
</body>
</html>
