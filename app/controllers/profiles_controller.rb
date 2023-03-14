# frozen_string_literal: true

class ProfilesController < ApplicationController
  def show
    @profile = current_user
  end
end
