class InstrumentalsController < ApplicationController

  def create
    instrumental = instrumental.create(instrumental_params)
    instrumental.update(user: @current_user)

    render json: vocal 
  end

  private

  def instrumental_params
    params.require(:instrumental).permit(:instrument)
  end

end
