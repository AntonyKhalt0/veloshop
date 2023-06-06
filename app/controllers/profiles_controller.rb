# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_profile, only: %i[show edit update]

  def show;  end

  def edit;  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile
    else
      render 'edit'
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :phone, :address)
  end

  def get_profile
    @profile = current_user
  end
end
