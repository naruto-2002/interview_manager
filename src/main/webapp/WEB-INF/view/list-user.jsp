<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
          href="assets\lib\material-design-icons\css\material-design-iconic-font.min.css">
    <link rel="stylesheet" type="text/css"
          href="assets\lib\datatables\datatables.net-bs4\css\dataTables.bootstrap4.css">
    <link rel="stylesheet" type="text/css"
          href="assets\lib\datatables\datatables.net-responsive-bs4\css\responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="assets\css\app.css" type="text/css">
</head>

<body>
<div class="be-wrapper be-fixed-sidebar">

</div>
<div class="container">
    <div class="row">
        <div class="col-md-2">
            <div class="form-group">
                <select class="form-control" id="roleSelect">
                    <option value="">All Roles</option>
                    <option value="developer">Developer</option>
                    <option value="designer">Designer</option>
                    <option value="manager">Manager</option>
                </select>
            </div>
        </div>

        <div class="col-md-8">
            <div class="input-group">
                <input type="text" class="form-control" id="searchInput" placeholder="Search ">

            </div>
        </div>

    </div>

    <div class="text-right">
        <button class="btn btn-primary" id="addButton">Add User</button>
    </div>

    <table class="table table-striped">
        <thead>
        <tr>
            <th>Username</th>
            <th>Email</th>
            <th>Phone No(s)</th>
            <th>Role</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>user123</td>
            <td>user123@example.com</td>
            <td>+1234567890, +9876543210</td>
            <td>Developer</td>
            <td>Active</td>
            <td class="action-buttons">
                <button class="btn btn-sm btn-info action-button">View</button>
                <button class="btn btn-sm btn-warning action-button">Edit</button>
                <button class="btn btn-sm btn-danger action-button">Delete</button>
            </td>
        </tr>
        <tr>
            <td>user456</td>
            <td>user456@example.com</td>
            <td>+9876543210</td>
            <td>Designer</td>
            <td>Inactive</td>
            <td class="action-buttons">
                <button class="btn btn-sm btn-info action-button">View</button>
                <button class="btn btn-sm btn-warning action-button">Edit</button>
                <button class="btn btn-sm btn-danger action-button">Delete</button>
            </td>
        </tr>
        <tr>
            <td>user789</td>
            <td>user789@example.com</td>
            <td>+1234567890</td>
            <td>Manager</td>
            <td>Active</td>
            <td class="action-buttons">
                <button class="btn btn-sm btn-info action-button">View</button>
                <button class="btn btn-sm btn-warning action-button">Edit</button>
                <button class="btn btn-sm btn-danger action-button">Delete</button>
            </td>
        </tr>
        </tbody>
    </table>
</div>
</body>

</html>