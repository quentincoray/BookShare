$(document).ready(function() {
  window.onload = function geoFindMe() {
    var output = document.getElementById("out");

    if (!navigator.geolocation){
      console.log("Geolocation is not supported by your browser");
      return;
    }

    function success(position) {
      var latitude  = position.coords.latitude;
      var longitude = position.coords.longitude;
      $("#latitude").val(latitude);
      $("#longitude").val(longitude);
        if ( !$('#latitude') != null && !$('#longitude') != null) {
          $("#submitsearch").removeAttr("disabled");
        };
      console.log('Latitude is ' + latitude + '° Longitude is ' + longitude + '°');
    }

    function error() {
      console.log("Unable to retrieve your location");
    }

    console.log("Locating…");

    navigator.geolocation.getCurrentPosition(success, error);
  }
});
