<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- header -->
<nav class="navbar navbar-expand fixed-top be-top-header">
    <div class="container-fluid">
        <div class="be-navbar-header"><a class="navbar-brand" href="index.html"></a>
        </div>
        <div class="page-title">
            <c:if test = "${roleName == 'Interviewer'}">
                <span>Interview Management</span>
            </c:if>

        </div>
        <div class="be-right-navbar">
            <ul class="nav navbar-nav float-right be-user-nav">
                <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
                                                 role="button" aria-expanded="false"><img src="\img\avatar.png" alt="Avatar">
                    <span class="user-name">${username}</span></a>
                    <div class="dropdown-menu" role="menu">
                        <div class="user-info">
                            <div class="user-name">${username}</div>
                            <div class="user-position online">${roleName}</div>
                        </div><a class="dropdown-item" href="pages-profile.html"><span
                            class="icon mdi mdi-face"></span>Account</a><a class="dropdown-item" href="#"><span
                            class="icon mdi mdi-settings"></span>Settings</a><a class="dropdown-item"
                                                                                href="pages-login.html"><span class="icon mdi mdi-power"></span>Logout</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>