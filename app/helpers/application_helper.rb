module ApplicationHelper
  def link_based_on_role(user)
    if user.admin?
      link_to '管理後臺', user_admin_path(account: user.account), class: 'font-bold py-3 px-5 bg-amber-500 text-white inline-block font-medium cursor-pointer'
    elsif user.employer?
      link_to '公司', company_path(account: user.account), class: 'font-bold py-3 px-5 bg-amber-500 text-white inline-block font-medium cursor-pointer'
    elsif user.job_seeker?
      link_to '個人資料', profile_path(account: user.account), class: 'font-bold py-3 px-5 bg-amber-500 text-white inline-block font-medium cursor-pointer'
    end
  end
end
