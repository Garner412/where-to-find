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
    .fail(function(response){
      console.log(resposne)
    })
  })
  $("#login-register").on("submit", "#login-form", function(event){
    event.preventDefault();

    var $form = $(this);
    var url = $form.attr('action');
    var type = $form.attr('method');
    var data = $form.serialize();

    $.ajax({
      url: url,
      type: type,
      data: data
    })
    .done(function(response){
      window.location.replace(response)

    })
    .fail(function(response){
      console.log(response)
      $("#login-errors").text("")
      $("#login-errors").append(response.responseText)
    })
  })
});


