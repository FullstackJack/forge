$(document).ready(function() {
    $('.admin.posts .post-content .body').summernote({
        disableResizeEditor: true,
        focus: true
    });
    $('time.timeago').timeago();
});

