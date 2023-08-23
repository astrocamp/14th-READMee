module ApplicationHelper
  def link_based_on_role(user)
    if user.admin?
      link_to '管理後臺', user_admin_path(account: user.account),
              class: 'hover:text-amber-600 mx-1'
    elsif user.employer?
      link_to '公司', company_path(account: user.account),
              class: 'hover:text-amber-600 mx-1'
    elsif user.job_seeker?
      link_to '個人資料', profile_path(account: user.account, id: user.id),
              class: 'hover:text-amber-600 mx-1'
    end
  end
end
