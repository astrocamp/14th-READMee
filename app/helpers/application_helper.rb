module ApplicationHelper
  def link_based_on_role(user)
    if user.admin?
      link_to '管理後臺', admin_users_path(account: user.account), class: 'hover:text-amber-600 mx-1'
    elsif user.role == 'job_seeker'
      link_to '個人檔案', dashboard_path(account: user.account)
    elsif user.role == 'employer'
      link_to '公司', new_company_path(account: user.account)
    end
  end
end
