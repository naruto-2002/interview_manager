package org.mock.interview_managerment.entities;

import lombok.RequiredArgsConstructor;
import org.mock.interview_managerment.enums.StatusEnum;
import org.mock.interview_managerment.repository.JobRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class JobService {
    @Autowired
    private JobRepository jobRepository;

    public Page<Job> getJobs(Pageable pageable) {
        return jobRepository.findAll(pageable);
    }

//    public List<Job> getJobs() {
//        return jobRepository.findAll();
//    }


    public Page<Job> searchJobs(String keyword, String status, Pageable pageable) {
        return jobRepository.findByKeywordAndStatus(keyword, status, pageable);
    }

    public List<Job> getAllJobs() {
        return jobRepository.findAll();
    }

    public Job saveJob(Job job) {
        return this.jobRepository.save(job);
    }

    public List<Job> saveListJob(List<Job> jobs) {
        return this.jobRepository.saveAll(jobs);
    }

    public Job getJobById(Long id) {
        Optional<Job> entity = jobRepository.findById(id);
        return entity.orElse(null); // Hoặc bạn có thể xử lý theo cách khác nếu không tìm thấy
    }

    public void deleteJobById(Long id) {
        jobRepository.deleteById(id);
    }

    public void updateJobStatus(List<Job> jobs) {
        LocalDate today = LocalDate.now();

        for (Job job : jobs) {
            LocalDate startDate = job.getStartDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            LocalDate endDate = job.getEndDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

            if (today.isAfter(startDate) && today.isBefore(endDate) || today.isEqual(startDate)
                    || today.isEqual(endDate)) {
                job.setStatus("Open");
            } else {
                job.setStatus("Close");
            }
        }

        jobRepository.saveAll(jobs);
    }

    public void updateJobStatus(Page<Job> jobPage) {
        LocalDate today = LocalDate.now();

        for (Job job : jobPage.getContent()) {
            LocalDate startDate = job.getStartDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            LocalDate endDate = job.getEndDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

            if (today.isAfter(startDate) && today.isBefore(endDate) || today.isEqual(startDate)
                    || today.isEqual(endDate)) {
                job.setStatus("Open");
            } else {
                job.setStatus("Close");
            }
        }

        jobRepository.saveAll(jobPage.getContent());
    }

    public void updateStatusJob(Job job) {
        LocalDate today = LocalDate.now();
        LocalDate startDate = job.getStartDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        LocalDate endDate = job.getEndDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

        if (today.isAfter(startDate) && today.isBefore(endDate) || today.isEqual(startDate)
                || today.isEqual(endDate)) {
            job.setStatus("Open");
        } else {
            job.setStatus("Close");
        }
    }


    public List<Job> getJobs() {
        return jobRepository.findAll();
    }

    public List<Job> getJobsByStatusOpen() {
        return jobRepository.findAllByStatus(StatusEnum.OPEN);
    }
}
