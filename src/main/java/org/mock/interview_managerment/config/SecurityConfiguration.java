package org.mock.interview_managerment.config;

import jakarta.servlet.DispatcherType;
import org.mock.interview_managerment.services.CustomUserDetailsService;
import org.mock.interview_managerment.services.UserService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfiguration {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder(10);
    }

    @Bean
    public UserDetailsService userDetailsService(UserService userService) {
        return new CustomUserDetailsService(userService);
    }

    @Bean
    public AuthenticationManager authenticationManager(HttpSecurity http,
                                                       PasswordEncoder passwordEncoder,
                                                       UserDetailsService userDetailsService) throws Exception {
        AuthenticationManagerBuilder authenticationManagerBuilder = http
                .getSharedObject(AuthenticationManagerBuilder.class);
        authenticationManagerBuilder
                .userDetailsService(userDetailsService)
                .passwordEncoder(passwordEncoder);
        return authenticationManagerBuilder.build();
    }

    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .authorizeHttpRequests(authorize -> authorize
                                .dispatcherTypeMatchers(DispatcherType.FORWARD, DispatcherType.INCLUDE).permitAll()
                                .anyRequest().permitAll()
//                        .requestMatchers("/","/reset-password" ,"/forgot-password" ,"/login", "/lib/**", "/css/**", "/js/**", "/img/**").permitAll()
//
//                        .requestMatchers("/user/**").hasRole("ADMIN")
//                        .requestMatchers("/candidate/**").hasAnyRole("ADMIN", "RECRUITER")
//                        .requestMatchers("/offers/**").hasAnyRole("ADMIN", "RECRUITER", "MANAGER")
//                        .requestMatchers("/job/**").hasAnyRole("ADMIN", "RECRUITER")
//                        .requestMatchers("/interview/**").hasAnyRole("ADMIN", "RECRUITER", "INTERVIEWER")

//                        .anyRequest().authenticated()
                )

                .formLogin(formLogin -> formLogin
                        .loginPage("/login")
                        .failureUrl("/login?error")
                        .permitAll());
        return http.build();
    }
}