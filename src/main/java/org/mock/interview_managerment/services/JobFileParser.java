package org.mock.interview_managerment.services;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.mock.interview_managerment.entities.Job;
import org.mock.interview_managerment.enums.StatusJobEnum;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class JobFileParser {

    public List<Job> parseExcelFile(MultipartFile file) throws Exception {
        List<Job> jobs = new ArrayList<>();
        try (InputStream is = file.getInputStream();
                Workbook workbook = new XSSFWorkbook(is)) {

            Sheet sheet = workbook.getSheetAt(0); // Lấy sheet đầu tiên

            for (int i = 1; i < sheet.getPhysicalNumberOfRows(); i++) { // Bắt đầu từ dòng thứ 2
                Row row = sheet.getRow(i);
                if (row == null) {
                    System.out.println("Dòng rỗng tại vị trí: " + i);
                    continue;
                }
                Job job = new Job();
                job.setTitle(getCellValue(row.getCell(0)));
                job.setDescription(getCellValue(row.getCell(1)));
                job.setRequiredSkills(getCellValue(row.getCell(2)));
                job.setLevel(getCellValue(row.getCell(3)));

                // Chuyển đổi chuỗi sang Timestamp

                job.setStartDate(convertToTimestamp(getCellValue(row.getCell(4))));
                job.setEndDate(convertToTimestamp(getCellValue(row.getCell(5))));

                job.setLocation(getCellValue(row.getCell(6)));
                job.setBenefits(getCellValue(row.getCell(7)));
                job.setStatus(StatusJobEnum.valueOf(getCellValue(row.getCell(8))));
                job.setSalaryFrom((getCellValue(row.getCell(9))).toString());
                job.setSalaryTo((getCellValue(row.getCell(10))).toString());

                System.out.println("Đã thêm job: " + job);
                jobs.add(job);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Đã xảy ra lỗi khi đọc file Excel: " + e.getMessage());
            throw e; // Rethrow hoặc xử lý lỗi tại đây
        }
        return jobs;
    }

    private Timestamp convertToTimestamp(String dateStr) {
        if (dateStr == null || dateStr.trim().isEmpty()) {
            return null; // Xử lý khi chuỗi trống
        }

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("M/d/yyyy H:mm");
        LocalDateTime dateTime = LocalDateTime.parse(dateStr, formatter);
        return Timestamp.valueOf(dateTime);
    }

    private String getCellValue(Cell cell) {
        if (cell == null) {
            return "";
        }
        switch (cell.getCellType()) {
            case STRING:
                return cell.getStringCellValue();
            case NUMERIC:
                if (DateUtil.isCellDateFormatted(cell)) {
                    // Chuyển đổi số thành chuỗi ngày tháng
                    return cell.getLocalDateTimeCellValue().format(DateTimeFormatter.ofPattern("M/d/yyyy h:mm"));
                } else {
                    return String.valueOf(cell.getNumericCellValue());
                }
            case BOOLEAN:
                return String.valueOf(cell.getBooleanCellValue());
            case FORMULA:
                return cell.getCellFormula();
            default:
                return "";
        }
    }
}