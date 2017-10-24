$(document).ready(function() {
  $(".movie-form-content").on("submit", function(event) {
    event.preventDefault();
    $('.content').html("")
    $('.content').prepend("<div class='loader'></div>")
    $form = $(event.target);
    $.ajax({
        method: $form.attr("method"),
        url: $form.attr("action"),
        data: $form.serialize()
    })
    .done(function(response) {
        $('.loader').hide()
        $(".content").html(response);
    })
  })

});
