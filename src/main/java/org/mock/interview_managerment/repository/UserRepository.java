package org.mock.interview_managerment.repository;

import org.mock.interview_managerment.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    @Query(value = "from User u where u.username = :username")
    Optional<User> findByUsername(String username);
}
