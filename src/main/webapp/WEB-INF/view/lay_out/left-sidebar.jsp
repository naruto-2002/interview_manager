<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="be-left-sidebar" style="margin-top: 60px;">
    <div class="left-sidebar-wrapper"><a class="left-sidebar-toggle" href="#">Dashboard</a>
        <div class="left-sidebar-spacer">
            <div class="left-sidebar-scroll ps ps--active-y">
                <div class="left-sidebar-content">
                    <ul class="sidebar-elements">
                        <li class="divider">Menu</li>
                        <li class="active"><a href="#"><i class="icon mdi mdi-home"></i><span>Home</span></a>
                        </li>
                        <li class="parent"><a href="#"><i class="icon mdi mdi-account"></i><span>User</span></a>
                            <ul class="sub-menu">
                                <li><a href="email-inbox.html">Inbox</a>
                                </li>
                                <li><a href="email-read.html">Email Detail</a>
                                </li>
                                <li><a href="email-compose.html">Email Compose</a>
                                </li>
                            </ul>
                        </li>

                    </ul>
                </div>

            </div>
        </div>

    </div>
</div>