$(function () {
  $('#show-hide-btn, #post-show-hide-btn').on('click', (e) => {
    let id = e.target.id;
    switch (id) {
      case 'show-hide-btn': $('.prefecture-field').fadeToggle(200); break;
      case 'post-show-hide-btn': $('.post-prefecture-field').fadeToggle(200); break;
      default: console.log(id);
    }
  });
});
