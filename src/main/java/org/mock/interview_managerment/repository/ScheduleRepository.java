package org.mock.interview_managerment.repository;

import org.mock.interview_managerment.entities.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Long> {
}