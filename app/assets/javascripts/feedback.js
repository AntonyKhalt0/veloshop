$(document).on('turbolinks:load', function(){
  $('.feedback').on('click', '.feedback-show-link', function(e) {
    e.preventDefault();
    if (this.classList.contains('text-truncate')) {
      $('div').removeClass('text-truncate');
    } else {
      $('div').addClass('text-truncate');
    }
  });
});
