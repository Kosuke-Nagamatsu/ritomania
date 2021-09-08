$(function () {
    $('#show-hide-btn').on('click', () => {
        $('.prefecture-field').fadeToggle(200);
    });
    $('.select2').select2({
          width: '60%',
          placeholder: ' テキスト入力で絞り込めます',
          multiple: true,
          language: "ja"
        });
    $('.select2_search').select2({
          width: '100%',
          placeholder: '入力で絞りこめます',
          allowClear: true,
          language: "ja"
        });
    $('.select2_user').select2({
          width: '100%',
          placeholder: ' テキスト入力で絞り込めます',
          multiple: true,
          language: "ja"
        });
});
