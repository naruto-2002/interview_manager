function confirmDelete(interviewId) {
    var confirmAction = confirm("Are you sure you want to delete this interview?");
    if (confirmAction) {
        window.location.href = '/interview/delete?interviewId=' + interviewId;
    }
}