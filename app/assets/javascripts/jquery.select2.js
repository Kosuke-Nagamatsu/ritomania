$(function () {
  $('.select2').select2({
    width: '60%',
    placeholder: ' テキスト入力で絞り込めます',
    multiple: true,
    language: "ja"
  });
  $('.select2_search').select2({
    width: '100%',
    placeholder: '離島名で検索（入力で絞り込めます）',
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
