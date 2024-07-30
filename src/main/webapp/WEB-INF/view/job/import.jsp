<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Excel File</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 50px;
        }

        .container {
            max-width: 600px;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .custom-file-label::after {
            content: "Choose file";
        }
    </style>
</head>

<body>
    <div class="container">
        <h2 class="mb-4 text-center">Upload Excel File</h2>
        <form action="/job/joblist/import" method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" class="custom-file-input" id="file" name="file" required>
                    <label class="custom-file-label" for="file">Choose Excel file</label>
                </div>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Upload</button>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        // Cập nhật tên tệp khi chọn tệp
        $(".custom-file-input").on("change", function () {
            var fileName = $(this).val().split("\\").pop();
            $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
        });
    </script>
</body>

</html>