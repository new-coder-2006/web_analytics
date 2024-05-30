class TrackersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      # Here we would handle the incoming tracking data
      visit = Visit.new(
        user_id: params[:user_id],
        page_url: params[:page_url],
        ip_address: request.remote_ip,
        user_agent: request.user_agent,
        duration: params[:duration].to_i
      )

      if visit.save
        render json: {status: 'success'}, status: :ok
      else
        render json: {status: 'error', 
                      errors: visit.errors.full_messages}, status: :unprocessable_entity
      end 
    end
end