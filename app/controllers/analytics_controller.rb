class AnalyticsController < ApplicationController
  def index
    begin
      th = TreasureHunt.inside_radius(params[:radius])

      th = th.between(params[:start_date], params[:end_date]) if th[:start_date] && params[:end_date]
    rescue StandardError => e
      render json: { "status": 'error', "error": e.message }, status: :bad_request
      return
    end
    render json: { "status": 'ok', "requests": th.as_json(only: %i[email current_location]) }
  end
end
