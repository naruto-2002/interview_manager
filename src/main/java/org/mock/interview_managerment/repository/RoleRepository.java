package org.mock.interview_managerment.repository;

import org.mock.interview_managerment.entities.Offer;
import org.mock.interview_managerment.entities.Role;
import org.springframework.data.jpa.repository.JpaRepository;


    Role findByRoleName(String name);

}
