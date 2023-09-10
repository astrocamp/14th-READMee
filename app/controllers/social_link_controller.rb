class SocialLinkController < ApplicationController
  before_action :set_social_link, only:[ :edit, :update, :destroy]
  before_action :set_profile, only: [:show, :create, :update, :destroy]

  def new
    @social_link = SocialLink.new
  end

  def create
    @social_link = SocialLink.new(social_link_params)
    @social_link.profile_id = @profile.id
    if @social_link.save
    respond_to do |format|
      find_social_link     
      format.turbo_stream { render turbo_stream: turbo_stream.replace('show_social', partial: 'social_link/show') }
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @social_link.update(social_link_params)
      find_social_link      
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('show_social', partial: 'social_link/show') }
      end
    else
      render :edit
    end
  end

  def destroy
    if @social_link.destroy
      find_social_link
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('show_social', partial: 'social_link/show') }
      end
    end
  end

  private

  def social_link_params
    params.require(:social_link).permit(:title, :link)
  end

  def set_profile
    @profile = current_user.profile
  end
 

  def set_social_link
    @social_link = SocialLink.find(params[:id])
  end

  def find_social_link
    @social_link = SocialLink.where(profile_id: @profile.id).order(id: :asc)
  end
end
