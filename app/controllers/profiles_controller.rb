class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :set_profile, only: %i[show edit update]
  before_action :prevent_edit, only: %i[edit update]

  def show; end

  def edit; end

  def update
    if @profile.update(profile_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:image, :degree, :affiliation, :research_fields, :contact, :education,
                                    :academic_affiliations).merge(user_id: current_user.id)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def prevent_edit
    redirect_to action: :show unless current_user.id == @profile.user_id
  end
end
