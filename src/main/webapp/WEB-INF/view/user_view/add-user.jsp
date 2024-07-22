<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="assets/img/logo-fav.png">
    <title>Beagle</title>
    <link rel="stylesheet" type="text/css" href="assets/lib/perfect-scrollbar/css/perfect-scrollbar.css">
    <link rel="stylesheet" type="text/css"
          href="assets/lib/material-design-icons/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" type="text/css"
          href="assets/lib/datatables/datatables.net-bs4/css/dataTables.bootstrap4.css">
    <link rel="stylesheet" type="text/css"
          href="assets/lib/datatables/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="assets/css/app.css" type="text/css">
</head>

<body>
<div class="be-wrapper be-fixed-sidebar">

</div>

<div class="be-left-sidebar">
</div>
<div class="be-content">
    <div class="container">
        <h1>User Registration</h1>
        <form>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="fullName">Full Name:</label>
                        <input type="text" class="form-control" id="fullName" placeholder="Enter your full name">
                    </div>
                    <div class="form-group">
                        <label for="dateOfBirth">Date of Birth:</label>
                        <input type="date" class="form-control" id="dateOfBirth">
                    </div>
                    <div class="form-group">
                        <label for="phoneNumber">Phone Number:</label>
                        <input type="tel" class="form-control" id="phoneNumber"
                               placeholder="Enter your phone number">
                    </div>
                    <div class="form-group">
                        <label for="role">Role:</label>
                        <select class="form-control" id="role">
                            <option value="">Select</option>
                            <option value="developer">Developer</option>
                            <option value="designer">Designer</option>
                            <option value="manager">Manager</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="status">Status:</label>
                        <select class="form-control" id="status">
                            <option value="">Select</option>
                            <option value="active">Active</option>
                            <option value="inactive">Inactive</option>
                        </select>
                    </div>



                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" id="email">
                    </div>
                    <div class="form-group">
                        <label for="address">Address:</label>
                        <input type="text" class="form-control" id="address">
                    </div>
                    <div class="form-group">
                        <label for="gender">Gender:</label>
                        <select class="form-control" id="gender">
                            <option value="">Select</option>
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="department">Department:</label>
                        <input type="text" class="form-control" id="department" placeholder="Enter your department">
                    </div>
                    <div class="form-group">
                        <label for="note">Note:</label>
                        <input class="form-control" id="note" rows="3">
                    </div>
                </div>
            </div>



            <div class="row">
                <div class="col-md-12">
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="button" class="btn btn-secondary">Cancel</button>
                </div>
            </div>
        </form>
    </div>
</div>


<div class="be-right-sidebar">
    <!-- Right sidebar -->
</div>

</body>