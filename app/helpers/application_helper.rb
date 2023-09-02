module ApplicationHelper
  def link_based_on_role(user)
    if user.admin?
      link_to '管理後臺', admin_users_path(account: user.account),
              class: 'hover:text-amber-600 mx-1'
    else
      link_to '儀表板', dashboard_path(account: user.account)
    end
  end
end
