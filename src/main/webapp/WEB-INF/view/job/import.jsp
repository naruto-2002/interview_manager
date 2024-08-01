<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Excel File</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="/css/app.css" type="text/css">
</head>

<body>
    <jsp:include page="../layout/header.jsp" />
    <jsp:include page="../layout/left-sidebar.jsp" />
    <div class="be-content">
        <div class="main-content container">
            <h2 class="mb-4 text-center">Upload Excel File</h2>
            <form id="uploadForm" action="/job/import" method="POST" enctype="multipart/form-data">
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" class="custom-file-input" id="file" name="file" required>
                        <label class="custom-file-label" for="file">Choose Excel file</label>
                    </div>
                    <div id="fileError" class="text-danger mt-2" style="display: none;">Please upload a valid Excel file
                        (.xls or .xlsx).</div>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Upload</button>
            </form>
            <div class="text-center mt-3">
                <a href="/job" class="btn btn-secondary">Back</a>
            </div>
        </div>
    </div>

    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 50px;
        }

        .container {
            max-width: 500px;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .custom-file-label::after {
            content: "Choose file";
        }

        #fileError {
            display: none;
        }
    </style>

    <script>
        // Cập nhật tên tệp khi chọn tệp
        document.querySelector(".custom-file-input").addEventListener("change", function () {
            var fileName = this.value.split("\\").pop();
            this.nextElementSibling.classList.add("selected");
            this.nextElementSibling.innerHTML = fileName;
        });

        // Kiểm tra định dạng tệp khi gửi biểu mẫu
        document.getElementById("uploadForm").addEventListener("submit", function (event) {
            var fileInput = document.getElementById("file");
            var file = fileInput.files[0];
            var allowedExtensions = /(\.xls|\.xlsx)$/i;

            if (!file) {
                return; // Nếu không có tệp được chọn, không thực hiện kiểm tra
            }

            if (!allowedExtensions.exec(file.name)) {
                event.preventDefault(); // Ngăn chặn việc gửi biểu mẫu
                document.getElementById("fileError").style.display = "block"; // Hiển thị thông báo lỗi
            } else {
                document.getElementById("fileError").style.display = "none"; // Ẩn thông báo lỗi
            }
        });
    </script>


    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script src="/lib/jquery/jquery.min.js" type="text/javascript"></script>
    <script src="/lib/perfect-scrollbar/js/perfect-scrollbar.min.js" type="text/javascript"></script>
    <script src="/lib/bootstrap/dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
    <script src="/js/app.js" type="text/javascript"></script>
    <script src="/lib/jquery.sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
    <script src="/lib/countup/countUp.min.js" type="text/javascript"></script>
    <script src="/lib/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
    <script src="/lib/jqvmap/jquery.vmap.min.js" type="text/javascript"></script>
    <script src="/lib/jqvmap/maps/jquery.vmap.world.js" type="text/javascript"></script>

</body>

</html>