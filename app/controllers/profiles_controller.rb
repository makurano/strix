class ProfilesController < ApplicationController
before_action :authenticate_user!, except: :show
before_action :set_profile, only: [:show, :edit, :update]
before_action :prevent_edit, only: [:edit, :update]

  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:image, :degree, :affiliation, :research_fields, :contact, :education, :academic_affiliations).merge(user_id: current_user.id)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def prevent_edit
    unless current_user.id == @profile.user_id
      redirect_to action: :show
    end
  end
end
