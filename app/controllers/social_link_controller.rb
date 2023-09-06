class SocialLinkController < ApplicationController
    def show
    end
    def new
    end

    def create
      @social_link = SocialLink.new(social_link_params)
      @social_link.profile_id = current_user.profile.id
      if @social_link.save
        redirect_to dashboard_path
      end
    end

    def edit
      @social_link = SocialLink.find(params[:id])
    end

    def update
      @social_link = SocialLink.find(params[:id])
      if @social_link.update(social_link_params)
        redirect_to dashboard_path
      else
        render :edit
        flash.now[:alert] = "請檢查欄位!"
      end
    end

    def destroy
      @social_link = SocialLink.find(params[:id])
      if @social_link.destroy
        redirect_to dashboard_path
      end
    end

    private

    def social_link_params
        params.require(:social_link).permit(:title, :link)
    end
end
