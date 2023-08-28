module ApplicationHelper
  def link_based_on_role(user)
    if user.admin?
      link_to '管理後臺', admin_users_path(account: user.account),
              class: 'hover:text-amber-600 mx-1'
    elsif user.employer?
      if user.company?
        link_to user.company.name, company_path(account: user.account),
                class: 'hover:text-amber-600 mx-1'
      else
        link_to '建立公司', new_company_path(account: user.account), class: 'hover:text-amber-600 mx-1'
      end
    elsif user.job_seeker?
      link_to user.account, profile_path(account: user.account, id: user.id),
              class: 'hover:text-amber-600 mx-1'
    end
  end
end
