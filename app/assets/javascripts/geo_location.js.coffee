geolocation_success = (p) ->
  $(".status").text("Geolocation success")
  window.location.replace("/meter?lon=" + p.coords.longitude + "&lat=" + p.coords.latitude)

geolocation_error = ->
  $(".status").text("Geolocation error")

$(document).ready ->
  if geo_position_js.init()
    geo_position_js.getCurrentPosition(geolocation_success, geolocation_error, {enableHighAccuracy:true})
  else
    alert "Geolocation not available"
