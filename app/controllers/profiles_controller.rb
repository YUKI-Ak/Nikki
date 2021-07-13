class ProfilesController < ApplicationController


  def show
  end

end


private
def profile_params
  params.require(:profile).permit(:about_me, :sns_id, :sns_address).merge(user_id: current_user.id)
end
