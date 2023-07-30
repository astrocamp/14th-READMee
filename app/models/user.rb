class User < ApplicationRecord
    validates :user_name, :email, :password, :real_name, :phone, presence: true
    # 檢查電話號碼是否符合台灣的格式 ex: 886 985958062
    validates :phone, presence: true, phone: { possible: false, allow_blank: false, countries: ['TW'] } 
end
