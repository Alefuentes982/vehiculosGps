class LocationsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    vehicle = Vehicle.find_or_create_by(identifier: params[:vehicle_identifier])

    location = vehicle.locations.create(
      latitude: params[:latitude],
      longitude: params[:longitude],
      sent_at: params[:sent_at]
    )

    if location.persisted?
      render json: { status: 'Ubicacion guardada' }, status: :created
    else
      render json: { status: 'Error al guardar ubicacion' }, status: :unprocessable_entity
    end
  end
end
