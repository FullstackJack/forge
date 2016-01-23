$(document).ready(function() {
    // Initialize Summernote
    $('.admin.posts .post-content .body').summernote({
        disableResizeEditor: true,
        focus: true
    });

    // Initialize jQuery.Timeago
    $('time.timeago').timeago();

    // Initialize Bootstrap Datetime Picker
    $('.datetimepicker').datetimepicker({
        allowInputToggle: true
    });
});

