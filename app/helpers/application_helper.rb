module ApplicationHelper
  def link_based_on_role(user)
    if user.admin?
      link_to '管理後臺', admin_users_path(account: user.account), class: 'nav-btn-signed-in'
    elsif user.role == 'job_seeker'
      link_to '個人檔案', dashboard_path(account: user.account), class: 'nav-btn-signed-in'
    elsif user.role == 'employer'
      if user.company.present?
        link_to user.company.name, company_show_path(user.company.id), class: 'nav-btn-signed-in'
      else
        link_to '建立公司', new_company_path(account: user.account), class: 'nav-btn-signed-in'
      end
    end
  end

  def display_application_records_button(user)
    if user.role == 'job_seeker' && user.job_matchings.any?
      link_to "應徵紀錄", apply_job_path(account: user.account), class: "nav-btn-signed-in"
    end
  end
end
