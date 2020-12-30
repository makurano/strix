class ProfilesController < ApplicationController
  def show
    @profile = Profile.find_by(user_id: current_user.id)
  end

end
