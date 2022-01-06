$(function () {
  // キーボード入力、値に変化があった場合、検索ボタンをクリック
  $('#search-form').on('keyup change', () => $('#search-form').find("input[type='submit']").trigger("click"));
});
