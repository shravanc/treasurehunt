class TreasureHuntController < ApplicationController
  def index
    render json: TreasureHunt.all, status: :ok
  end

  def create
    th = TreasureHunt.new(treasure_hunt_params)
    if th.save
      render json: { status: 'ok', distance: th.distance }, status: :ok
    else
      render json: { status: 'error', distance: -1, error: th.errors.full_messages }, status: :bad_request
    end
  end

  private

  def treasure_hunt_params
    params.permit(:email, [:current_location => []])
  end
end
