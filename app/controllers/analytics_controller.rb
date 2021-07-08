class AnalyticsController < ApplicationController

  def index
    begin
      th = TreasureHunt
      .between(params[:start_date], params[:end_date])
      .inside_radius(params[:radius])
    rescue StandardError => e
      render json: { "status": "error", "error": e.message }, status: :bad_request
      return
    end
    render json: { "status": 'ok', "requests": th.as_json(only: [:email, :current_location]) }
  end
  
end
