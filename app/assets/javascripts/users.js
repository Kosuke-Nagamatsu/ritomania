$(function () {
    $('#tooltip').hide();
    $('#mania-count, #tooltip').hover(
    function () {
        $('#tooltip').fadeIn('fast').stop(false, true);
    },
    function () {
        $('#tooltip').fadeOut('fast').stop(false, true);
    });
});
