class ProfileController < ApplicationController
  before_action :set_profile, only: [:show]
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
  rescue_from RailsParam::Param::InvalidParameterError, with: :handle_invalid_parameter
  
  # Show a Profile
  def show
    render json: ProfileSerializer.new(@profile)
  end

  # Autocomplete for profile
  def autocomplete_profile
    @profiles = ::Autocomplete.new.autocomplete(params[:content], User, 'username')
    return render json: @profiles if @profiles != []
  end

  private

  def set_profile
    @profile = User.find(params[:id])
  end
end
