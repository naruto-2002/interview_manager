package org.mock.interview_managerment.repository;

import org.mock.interview_managerment.entities.Offer;
import org.mock.interview_managerment.entities.Role;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {

    Role findByRoleName(String name);

    List<Role> findAll();
}
