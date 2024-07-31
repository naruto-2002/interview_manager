package org.mock.interview_managerment.repository;

import org.mock.interview_managerment.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

//crud: create, read, update, delete
@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User eric);

    void deleteById(long id);

    List<User> findOneByEmail(String email);

    public Optional<User> findById(Long id);

    List<User> findAll();

    User findById(long id); // null

    public boolean existsByEmail(String email);

    public User findByEmail(String email);

    public User findByUserId(Long id);

    public  Optional<User> findByUsername(String username);

    @Query("SELECT u FROM User u WHERE " +
            "LOWER(u.email) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(u.username) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(u.phoneNumber) LIKE LOWER(CONCAT('%', :keyword, '%'))")
    List<User> search(@Param("keyword") String keyword);

    @Query("SELECT u FROM User u WHERE u.role.roleName = 'MANAGER'")
    List<User> findByRoleRoleName(String roleName);
    List<User> findByRole_RoleId(Long roleId);

    //    Code van
    @Query("SELECT u FROM User u WHERE u.role.roleName = :roleName")
    List<User> findByRoleName(String roleName);

    @Query("SELECT u FROM User u WHERE u.userId = :userId")
    User findByUserId(long userId);
}