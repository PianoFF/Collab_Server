class LocationsController < ApplicationController

  def create
    location = Location.create(location_params)

    if location.valid?
      render json: location
    else
      render json: { errors: location.errors.full_message }, status: :not_acceptable
    end 
  end

end
