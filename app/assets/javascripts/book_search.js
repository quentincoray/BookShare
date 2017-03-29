$(document).ready(function() {
  $('#searched_books').on('keyup', function(event) {
    if(this.value.length < 6) return;
      console.log($('#searched_books').val());
      $.ajax({
        type: "GET",
        url: "https://www.googleapis.com/books/v1/volumes?q="+($('#searched_books').val())+"&printType=books&key=<%= ENV['GOOGLE_API_BROWSER_KEY'] %>",
        success: function(data) {
          $(".container-api-img").html('<div id="results"></div>');
          data.items.forEach(function(item) {
            var book_title = item.volumeInfo.title;
            var book_author = item.volumeInfo.authors;
            var book_image = item.volumeInfo.imageLinks.thumbnail;
            var book_isbn = item.volumeInfo.industryIdentifiers[0].identifier;
            $("#results").append("<a href='#' class='api-img-link'><img src='"+book_image+"' class='api-img' data-isbn='"+book_isbn+"' data-title='"+book_title+"' data-author='"+book_author+"'/></a>");
          });
        },
        error: function(jqXHR) {
          console.error(jqXHR.responseText);
        }
      });
  });
  var selected_books = 0
  $('.container-api-img').on("click", '.api-img-link', function(event) {
    event.preventDefault();
    $(".title-search").html("<h2>Vous avez sélectionné: </h2>");
    $("#search-results").css("background-color", "white");
    if(selected_books < 3) {
      $(".selected-book-cover").css("background-color", "white");
      $(".selected-book-cover").prepend(this);
      selected_books ++;
    };
  var isbn_1 = ($(".selected-book-cover a:nth-child(1) img").data("isbn"));
  $("#isbn_1").val(isbn_1);
  var isbn_2 = ($(".selected-book-cover a:nth-child(2) img").data("isbn"));
  $("#isbn_2").val(isbn_2);
  var isbn_3 = ($(".selected-book-cover a:nth-child(3) img").data("isbn"));
  $("#isbn_3").val(isbn_3);
  });
});
