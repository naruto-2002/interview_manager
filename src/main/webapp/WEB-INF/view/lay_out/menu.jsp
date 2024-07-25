<div class="be-left-sidebar">
    <div class="left-sidebar-wrapper">
        <div class="left-sidebar-spacer">
            <div class="left-sidebar-scroll">
                <div class="left-sidebar-content">
                    <ul class="sidebar-elements">
                        <li class="divider">Menu</li>
                        <li class="active"><a href="index.html"><i class="icon mdi mdi-home"></i><span>Home</span></a>
                        </li>

                        <c:if test = "${roleName == 'Interviewer'}">
                            <li class="parent"><a href="/interview_schedule/list"><i class="icon mdi mdi-accounts-list"></i><span>Inerview Schedule</span></a>
                            </li>
                        </c:if>



                        </li>
                    </ul>
                </div>
            </div>
        </div>

    </div>
</div>