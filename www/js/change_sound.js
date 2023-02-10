$(document).ready(function () {
  Shiny.addCustomMessageHandler("change_sound", function(path) {
    let player = document.getElementById("player");
    player.src = path;
  });
});
                