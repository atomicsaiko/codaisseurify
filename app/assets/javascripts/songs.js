function submitSong(event) {
  event.preventDefault();

  createSong($("#song-input").val());
  $("#song-input").val(null);
}

function createSong(songName) {
  var artistId = window.location.pathname.substr(-1);
  var newSong = { name: songName };


  $.ajax({
    type: "POST",
    url: "/artists/" + artistId + "/songs.json",
    data: JSON.stringify({
      song: newSong
    }),
    contentType: "application/json",
    dataType: "json"
  })
  .done(function(data) {
    console.log("Song succesfully added")
    console.log(data);

    var songId = data.id;
    console.log("The song ID is:", songId); //Not getting songId back..
    var deleteSongUri = `/artists/${artistId}/songs/${songId}`

    var deleteSongButton = $('<a class="btn btn-danger" data-confirm="Are you sure?" rel="nofollow" data-method="delete"</a>')
      .attr('href', deleteSongUri)
      .html('Delete song');

    var listItem = $('<li></li>')
      .html(songName + ' | ')
      .append(deleteSongButton);

    $("#song-list").append(listItem);

      // <a class="btn btn-danger" data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="/artists/2/songs/4">Delete song</a>
  })
  .fail(function(error) {
    console.log(error)
  })
}

$(document).ready(function() {
  $("#add-song").bind('click', submitSong);
  // $("form").bind('submit', submitTodo);
  // $("#clean-up").bind('click', cleanUpDoneTodos);
});
