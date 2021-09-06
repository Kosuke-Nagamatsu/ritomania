$(function () {
    $('#show-hide-btn').on('click', () => {
        $('.prefecture-field').fadeToggle(200);
    });
    $('.select2').select2({
          width: 600,
          multiple: true,
        });
});
