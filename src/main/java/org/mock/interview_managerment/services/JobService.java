package org.mock.interview_managerment.services;

import lombok.RequiredArgsConstructor;
import org.mock.interview_managerment.entities.Job;
import org.mock.interview_managerment.enums.StatusJobEnum;
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
        return jobRepository.findAllByIsDeletedFalse(pageable);
        // return jobRepository.findAll(pageable);
    }

    // public List<Job> getJobs() {
    // return jobRepository.findAll();
    // }

    public Page<Job> searchJobs(String keyword, StatusJobEnum status, Pageable pageable) {
        return jobRepository.findByKeywordAndStatus(keyword, StatusJobEnum.valueOf(String.valueOf(status)), pageable);
    }

    public Page<Job> searchJobsStatusNull(String keyword, Pageable pageable) {
        return jobRepository.findByKeyword(keyword, pageable);
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
                job.setStatus(StatusJobEnum.OPEN);
            } else {
                job.setStatus(StatusJobEnum.CLOSE);
            }
        }

        jobRepository.saveAll(jobs);
    }

    public void softDeleteJobById(long id) {
        jobRepository.findById(id).ifPresent(job -> {
            job.setIsDeleted(true);
            jobRepository.save(job);
        });
    }

    public void updateJobStatus(Page<Job> jobPage) {
        LocalDate today = LocalDate.now();

        for (Job job : jobPage.getContent()) {
            LocalDate startDate = job.getStartDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            LocalDate endDate = job.getEndDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

            if (today.isAfter(startDate) && today.isBefore(endDate) || today.isEqual(startDate)
                    || today.isEqual(endDate)) {
                job.setStatus(StatusJobEnum.OPEN);
            } else {
                job.setStatus(StatusJobEnum.CLOSE);
            }
        }

        jobRepository.saveAll(jobPage.getContent());
    }

    public void updateJobIsDeleted(Page<Job> jobPage) {
        for (Job job : jobPage.getContent()) {
            job.setIsDeleted(false);
        }
        jobRepository.saveAll(jobPage.getContent());

    }

    public void updateStatusJob(Job job) {
        LocalDate today = LocalDate.now();
        LocalDate startDate = job.getStartDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        LocalDate endDate = job.getEndDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

        if (today.isAfter(startDate) && today.isBefore(endDate) || today.isEqual(startDate)
                || today.isEqual(endDate)) {
            job.setStatus(StatusJobEnum.OPEN);
        } else {
            job.setStatus(StatusJobEnum.CLOSE);
        }
    }

    public List<Job> getJobs() {
        return jobRepository.findAll();
    }
    public List<Job> getJobsByStatusOpen() {
        return jobRepository.findAllByStatus(StatusJobEnum.OPEN);
    }
}
