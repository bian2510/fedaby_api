class ProfileController < ApplicationController
  before_action :set_profile, only: [:show]
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
  rescue_from RailsParam::Param::InvalidParameterError, with: :handle_invalid_parameter
  def show
    render json: ProfileSerializer.new(@profile)
  end

  private

  def set_profile
    @profile = User.find(params[:id])
  end
end
