skills = [
  'HTML', 'CSS', 'JavaScript', 'React', 'Vue.js',
  'SASS/SCSS', 'Responsive Design', 'Version Control (Git)',
  'Ruby on Rails', 'Python (Django)', 'Java (Spring Boot)',
  'Node.js (Express)', 'PHP', 'API Design and Development',
  'Database Management', 'Server Management and Deployment',
  'Security', 'RESTful Architecture',
  '有效溝通', '問題解決能力', '團隊合作', '時間管理', '適應變化',
  '領導與協作', '創造思考', '批判性思考', '情緒智商', '適應力',
]

skills.each do |skill_tag|
  Skill.find_or_create_by(tag: skill_tag)
end

users = [
  { email: "readmee01@gmail.com", password: "password", role: 1, confirmed_at: Time.now },
  { email: "readmee02@gmail.com", password: "password", role: 1, confirmed_at: Time.now },
  { email: "readmee03@gmail.com", password: "password", role: 1, confirmed_at: Time.now },
]

created_users = User.create(users)

companies = [
  { name: "財報貓", address: "台北市", phone: "27279898", about: "財報貓是您的財務報表專家。...", population: 7, user_id: created_users[0].id },
  { name: "柯達", address: "台北市", phone: "27270857", about: "柯達是您轉職成為優秀軟體工程師的夥伴。...", population: 100, user_id: created_users[1].id },
  { name: "七倍祝福", address: "台北市", phone: "27275252", about: "七倍祝福是智能AI的先驅，...", population: 5, user_id: created_users[2].id },
]

companies.each do |company|
  Company.create(company)
end

jobs = [
  { title: "前端工程師", content: "工作職責：...", num_of_people: "1", seniority: "無經驗可", salary: "面議", company_id: Company.find_by(name: "財報貓").id },
  { title: "後端工程師", content: "工作職責：...", num_of_people: "1", seniority: "無經驗可", salary: "面議", company_id: Company.find_by(name: "財報貓").id },
  { title: "資深前端工程師", content: "工作職責：...", num_of_people: "1", seniority: "三年以上", salary: "面議", company_id: Company.find_by(name: "柯達").id },
  { title: "資深後端工程師", content: "工作職責：...", num_of_people: "1", seniority: "三年以上", salary: "面議", company_id: Company.find_by(name: "柯達").id },
  { title: "python工程師", content: "工作職責：...", num_of_people: "1", seniority: "無經驗可", salary: "面議", company_id: Company.find_by(name: "七倍祝福").id },
  { title: "資深python工程師", content: "工作職責：...", num_of_people: "1", seniority: "三年以上", salary: "面議", company_id: Company.find_by(name: "七倍祝福").id },
]

jobs.each do |job|
  Job.create(job)
end
