class PointsofsaleController < ApplicationController
  skip_before_action :admin_only
  skip_before_action :authorize
  def index
    @maps = Map.all
    @hash = Gmaps4rails.build_markers(@maps) do |map, marker|
  marker.lat map.latitude
  marker.lng map.longitude
  marker.infowindow map.description
  marker.picture({
    "url" => "/elem/icon-map.png",
    "width" => 80,
    "height" => 90})
  marker.json({title: map.title})
  end
  end
end
