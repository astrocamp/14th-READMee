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