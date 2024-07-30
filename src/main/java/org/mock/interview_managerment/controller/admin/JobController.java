package org.mock.interview_managerment.controller.admin;

import org.mock.interview_managerment.entities.Job;
import org.mock.interview_managerment.services.JobFileParser;
import org.mock.interview_managerment.services.JobService;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class JobController {
    private final JobService jobService;

    public JobController(JobService jobService) {
        this.jobService = jobService;
    }

    @GetMapping("/job/joblist")
    public String listJobs(Model model,
            @RequestParam("p") Optional<Integer> p,
            @RequestParam(value = "keyword", required = false) String keyword,
            @RequestParam(value = "status", required = false) String status) {
        int pageNumber = p.orElse(0);
        Pageable pageable = PageRequest.of(pageNumber, 10);
        Page<Job> page;
        if ((keyword != null && !keyword.isEmpty()) || (status != null && !status.isEmpty())) {
            page = jobService.searchJobs(keyword, status, pageable);

        } else {
            page = jobService.getJobs(pageable);
        }
        jobService.updateJobStatus(page);
        model.addAttribute("listjobs", page);
        return "job/jobList";
    }

    @GetMapping("/job/joblist/import")
    public String showImportPage() {
        return "job/import"; // Tên của trang HTML để tải lên file
    }

    @PostMapping("/job/joblist/import")
    public String handleFileUpload(@RequestParam("file") MultipartFile file) {
        try {
            JobFileParser parser = new JobFileParser();
            List<Job> jobs = parser.parseExcelFile(file);
            jobService.saveListJob(jobs);
            System.out.println("đây là jobs" + jobs);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("lỗi controller: " + e.getMessage());
        }
        return "redirect:/job/joblist";
    }

    @GetMapping("/job/joblist/create")
    public String showCreateJobForm(Model model) {
        model.addAttribute("job", new Job());
        return "/job/createJob";
    }

    @PostMapping("/job/joblist/create")
    public String createJob(
            @RequestParam String title,
            @RequestParam String description,
            @RequestParam String requiredSkills,
            @RequestParam String level,
            @RequestParam String startDate,
            @RequestParam String endDate,
            @RequestParam String location,
            @RequestParam String benefits,
            @RequestParam String salaryFrom,
            @RequestParam String salaryTo,
            Model model) {

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        try {
            // Parse String to Date
            Date start = format.parse(startDate);
            Date end = format.parse(endDate);

            // Convert Date to Timestamp
            Timestamp startTimestamp = new Timestamp(start.getTime());
            Timestamp endTimestamp = new Timestamp(end.getTime());

            // Create new Job entity
            Job job = new Job();
            job.setTitle(title);
            job.setDescription(description);
            job.setRequiredSkills(requiredSkills);
            job.setLevel(level);
            job.setStartDate(startTimestamp);
            job.setEndDate(endTimestamp);
            job.setLocation(location);
            job.setBenefits(benefits);
            job.setSalaryFrom(salaryFrom);
            job.setSalaryTo(salaryTo);
            jobService.updateStatusJob(job);

            // Save Job
            jobService.saveJob(job);

            // Redirect to job list page or success page
            return "redirect:/job/joblist";

        } catch (ParseException e) {
            // Handle parse exception
            e.printStackTrace();
            return "error"; // Return to an error page or handle accordingly
        }
    }

    @RequestMapping("/job/joblist/detail/{id}")
    public String getJobrDetailPage(Model model, @PathVariable long id) {
        System.out.println("check path id = " + id);
        Job jobdetail = this.jobService.getJobById(id);
        model.addAttribute("jobdetail", jobdetail);
        return "job/jobDetail";
    }

    @RequestMapping("/job/joblist/delete/{id}")
    public String getDeleteJob(Model model, @PathVariable long id) {
        jobService.deleteJobById(id);
        return "redirect:/job/joblist";
    }

    @RequestMapping("/job/joblist/update/{id}")
    public String getJobUpdatePage(Model model, @PathVariable long id) {
        Job updateJob = this.jobService.getJobById(id);
        System.out.println(updateJob);
        model.addAttribute("update", updateJob);
        return "job/updateJob";
    }

    @PostMapping("/job/joblist/update")
    public String updateJob(@RequestParam Long id,
            @RequestParam String title,
            @RequestParam String description,
            @RequestParam String requiredSkills,
            @RequestParam String level,
            @RequestParam String startDate,
            @RequestParam String endDate,
            @RequestParam String location,
            @RequestParam String benefits,
            @RequestParam String salaryFrom,
            @RequestParam String salaryTo,
            Model model) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        try {
            // Parse String to Date
            Date start = format.parse(startDate);
            Date end = format.parse(endDate);

            // Convert Date to Timestamp
            Timestamp startTimestamp = new Timestamp(start.getTime());
            Timestamp endTimestamp = new Timestamp(end.getTime());

            // Create new Job entity
            Job job = this.jobService.getJobById(id);
            job.setTitle(title);
            job.setDescription(description);
            job.setRequiredSkills(requiredSkills);
            job.setLevel(level);
            job.setStartDate(startTimestamp);
            job.setEndDate(endTimestamp);
            job.setLocation(location);
            job.setBenefits(benefits);
            job.setSalaryFrom(salaryFrom);
            job.setSalaryTo(salaryTo);
            jobService.updateStatusJob(job);

            // Save Job
            jobService.saveJob(job);

            // Redirect to job list page or success page
            return "redirect:/job/joblist";

        } catch (ParseException e) {
            // Handle parse exception
            e.printStackTrace();
            return "error"; // Return to an error page or handle accordingly
        }
    }

}
