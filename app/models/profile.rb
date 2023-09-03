class Profile < ApplicationRecord
  validates :full_name, :phone, :address, :job_title, :education, :work_experience, presence: true

  # relationships
  belongs_to :user
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [128, 128]
  end
  has_many :profile_skills
  has_many :skills, through: :profile_skills
  has_many :work_experiences
  has_many :educations
  has_many :projects

  def self.address_options
    counties = [
      "基隆市",
      "臺北市",
      "新北市",
      "桃園市",
      "新竹市",
      "新竹縣",
      "苗栗縣",
      "臺中市",
      "彰化縣",
      "南投縣",
      "雲林縣",
      "嘉義市",
      "嘉義縣",
      "臺南市",
      "高雄市",
      "屏東縣",
      "宜蘭縣",
      "花蓮縣",
      "臺東縣",
      "澎湖縣",
      "金門縣",
      "連江縣"
    ]
  end

  def self.job_title_options
    job_title = ['軟體工程師',
                 '前端工程師',
                 '後端工程師',
                 '全端工程師',
                 '軟體開發工程師',
                 '系統工程師',
                 '資深軟體工程師',
                 '軟體設計師',
                 '軟體架構師']
  end
end
