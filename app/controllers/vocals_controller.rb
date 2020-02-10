class VocalsController < ApplicationController

  def create
    vocal = Vocal.create(vocal_params)
    vocal.update(user: @current_user)

    render json: vocal 
  end

  private

  def vocal_params
    params.require(:vocal).permit(:voice_type)
  end
end
