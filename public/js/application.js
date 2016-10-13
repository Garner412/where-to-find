$(document).ready(function() {
  $('.register-login').on('click', function(event) {
    event.preventDefault();
    var $link = $(this)
    $.ajax({
      url: $link.attr('href')
    })
    .done(function(response) {
      $('#login-register').html(response);
      $('#login-register').show();
    })
  })
});
