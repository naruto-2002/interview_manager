package org.mock.interview_managerment.services;

import lombok.Data;
import org.mock.interview_managerment.repository.RoleRepository;
import org.springframework.stereotype.Service;

@Service
@Data
public class RoleService {

    private final RoleRepository roleRepository;
}
