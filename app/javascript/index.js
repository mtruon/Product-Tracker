$(document).ready(function() {
    $("tr[data-link]").click(function() {
        window.location = $(this).data("link");
        console.log("TESTING");
    });
});
