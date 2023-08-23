class UsersController < ApplicationController
    def toggle
        if current_user.employer?
          current_user.update(role: 'job_seeker')
        elsif current_user.job_seeker?
          current_user.update(role: 'employer')
        end
        redirect_to root_path, notice: "角色已切换"
      end
end
