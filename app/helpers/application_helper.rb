module ApplicationHelper
  def link_based_on_role(user)
    if user.admin?
      link_to '管理後臺', admin_users_path(account: user.account), class: 'nav-btn-signed-in'
    elsif user.role == 'job_seeker'
      link_to '個人檔案', dashboard_path(account: user.account), class: 'nav-btn-signed-in'
    elsif user.role == 'employer'
      if user.company.present?
        link_to '公司', company_show_path(user.company.id)
      else
        link_to '公司', new_company_path(account: user.account)
      end
      link_to '公司', new_company_path(account: user.account), class: 'nav-btn-signed-in'
    end
  end

  def show_registration_button
    if current_user
      false
    else
      true
    end
  end
end
