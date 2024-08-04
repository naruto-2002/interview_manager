<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Offers</title>
    <link rel="stylesheet" type="text/css" href="/lib/perfect-scrollbar/css/perfect-scrollbar.css">
    <link rel="stylesheet" type="text/css" href="/lib/material-design-icons/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" type="text/css" href="/lib/datatables/datatables.net-bs4/css/dataTables.bootstrap4.css">
    <link rel="stylesheet" type="text/css"
          href="/lib/datatables/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="/css/app.css" type="text/css">
    <link rel="stylesheet" href="/css/offer/index.css" type="text/css">
    <style>
        .dropdown-menu.custom-dropdown {
            transform: translate3d(-123px, 45px, 0); /* Điều chỉnh vị trí của menu */
            /* Nếu cần điều chỉnh thêm: */
            /* top: 100%; */
            /* left: 0; */
            /* margin: 0; */
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp"/>
<jsp:include page="../layout/left-sidebar.jsp"/>

<div class="be-content" style="margin-top: 60px;">
    <div class="main-content container-fluid">
        <div class="" style="margin-top: 0px">
            <h2 class="">Offer Export</h2>
            <nav aria-label="breadcrumb" role="navigation">
                <ol class="breadcrumb page-head-nav">
                    <li class="breadcrumb-item active">Offer List</li>
                </ol>
            </nav>
        </div>

        <div class="form-group row p-4">
            <form action="/offers/export" method="get" class="col-12 d-flex justify-content-between">
                <div class="col-12 col-sm-5 col-lg-4">
                    <div class="input-group input-search">
<%--                        <input class="form-control" type="date" name="start" placeholder="Start Date:">--%>
                        <span class="input-group-btn">
                            <button class="btn btn-primary" type="submit"><i class="icon mdi mdi-search text-white"></i></button>
                        </span>
                    </div>
                        <label for="startDate">Start Date:</label>
                        <input type="date" id="startDate" name="start" required>
                        <label for="endDate">End Date:</label>
                        <input type="date" id="endDate" name="end" required>
                        <button type="submit">Filter Offers</button>
                </div>
            </form>
        </div>

        <div class="col-sm-12">
            <div class="card card-table">
                <div class="card-body">
                    <div id="table2_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                        <div class="row be-datatable-body">
                            <div class="col-sm-12">
                                <table class="table table-striped table-hover table-fw-widget dataTable no-footer"
                                       id="table2" role="grid" aria-describedby="table2_info">
                                    <thead>
                                    <tr role="row">
                                        <th class="text-center">Candidate Name</th>
                                        <th class="text-center">Email</th>
                                        <th class="text-center">Contract Type</th>
                                        <th class="text-center">Department</th>
                                        <th class="text-center">Level</th>
                                        <th class="text-center">Position</th>
                                        <th class="text-center">Status</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${offerPage.content}" var="offer">
                                        <tr class="gradeA odd" role="row">
                                            <td class="text-center">${offer.candidate.name}</td>
                                            <td class="text-center">${offer.candidate.email}</td>
                                            <td class="text-center">${offer.contractType}</td>
                                            <td class="text-center">${offer.department}</td>
                                            <td class="text-center">${offer.level}</td>
                                            <td class="text-center">${offer.position}</td>
                                            <td class="text-center">${offer.status}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- Delete Confirmation Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabel">Delete Confirmation</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are you sure you want to delete this offer?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-danger" id="confirmDeleteButton">Delete</button>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
    function showDeleteModal(offerId) {
        $('#confirmDeleteButton').attr('onclick', 'confirmDelete(' + offerId + ')');
        $('#deleteModal').modal('show');
    }

    function confirmDelete(offerId) {
        window.location.href = '/offers/delete/' + offerId;
    }
</script>
</body>
</html>
