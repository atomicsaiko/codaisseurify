function submitSong(event) {
  event.preventDefault();

  createSong($("#song-input").val());
  $("#song-input").val(null);
}

function createSong(songName) {
  url = window.location.pathname.substr(-1);
  var newSong = { name: songName };


  $.ajax({
    type: "POST",
    url: "/artists/" + url + "/songs.json",
    data: JSON.stringify({
      song: newSong
    }),
    contentType: "application/json",
    dataType: "json"
  })
  .done(function(data) {
    console.log("Song succesfully added")
    console.log(data);
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
