$(function () {
    $('#show-hide-btn').on('click', () => {
        $('.prefecture-field').fadeToggle(200);
    });
    $('.select2').select2({
          width: 600,
          multiple: true,
        });
    $('.select2_search').select2({
          width: '100%',
          placeholder: 'テキスト入力できます',
          allowClear: true,
        });
});
