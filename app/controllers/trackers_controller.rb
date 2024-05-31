class TrackersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      Rails.logger.debug "Received params: #{params.inspect}"
      user = User.find_by(tracking_code: params[:tracking_code])

      if user.nil?
        Rails.logger.debug "User not found with tracking code: #{params[:tracking_code]}"
        render json: { status: 'error', message: 'Invalid tracking code' }, status: :unprocessable_entity unless user
        return
      end

      Rails.logger.debug "Found user: #{user.inspect}"

      # Here we would handle the incoming tracking data
      visit = Visit.new(
        user_id: user.id,
        page_url: params[:page_url],
        ip_address: request.remote_ip,
        user_agent: request.user_agent,
        duration: params[:duration].to_i
      )

      Rails.logger.debug "New visit: #{visit.inspect}"

      if visit.save
        Rails.logger.debug "Visit saved successfully: #{visit.inspect}"
        render json: {status: 'success'}, status: :ok
      else
        Rails.logger.debug "Error saving visit: #{visit.errors.full_messages.inspect}"
        render json: {status: 'error', 
                      errors: visit.errors.full_messages}, status: :unprocessable_entity
      end 
    end
end