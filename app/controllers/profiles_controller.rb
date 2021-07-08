class ProfilesController < ApplicationController

  def index
    @profile = Profile.all
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to profile_path
    else
      render :new
    end
  end

  def show
  end

end


private
def profile_params
  params.require(:profile).permit(:about_me, :sns_id, :sns_address).merge(user_id: current_user.id)
end
