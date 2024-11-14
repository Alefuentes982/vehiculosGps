class MapController < ApplicationController
  def show
    @vehicles = Vehicle.includes(:locations).map do |vehicle|
      {
        identifier: vehicle.identifier,
        latest_location: vehicle.locations.order(sent_at: :desc).first
      }
    end
  end
end
