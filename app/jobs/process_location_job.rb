class ProcessLocationJob < ApplicationJob
  queue_as :default

  def perform(vehicle_identifier, latitude, longitude, sent_at)
    # Do something later
    vehicle = Vehicle.find_or_create_by(identifier: vehicle_identifier)

    vehicle.locations.create(latitude: latitude, longitude: longitude, sent_at: sent_at)
  end
end
