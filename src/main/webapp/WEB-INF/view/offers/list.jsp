<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Offer List</title>
</head>
<body>
<h2>Offer List</h2>
<table>
    <tr>
        <th>ID</th>
        <th>Basic Salary</th>
        <th>Due Date</th>
        <th>Start Contract</th>
        <th>End Contract</th>
        <th>Note</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="offer" items="${offers}">
        <tr>
            <td>${offer.offerId}</td>
            <td>${offer.basicSalary}</td>
            <td>${offer.dueDate}</td>
            <td>${offer.startContract}</td>
            <td>${offer.endContract}</td>
            <td>${offer.note}</td>
            <td>
                <a href="${pageContext.request.contextPath}/offers/${offer.offerId}">View</a>
                <a href="${pageContext.request.contextPath}/offers/delete/${offer.offerId}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="${pageContext.request.contextPath}/offers/new">Create New Offer</a>
</body>
</html>
