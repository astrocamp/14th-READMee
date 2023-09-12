class Project < ApplicationRecord
  validates :title, :use_skill, :content, presence: true
  
  belongs_to :profile
  def self.use_skill
    skill = [
      "HTML",
      "CSS",
      "JavaScript",
      "React",
      "Angular",
      "Vue.js",
      "Node.js",
      "Express.js",
      "Python",
      "Django",
      "Ruby",
      "Ruby on Rails",
      "PHP",
      "Laravel",
      "SQL",
      "NoSQL",
      "RESTful API",
      "GraphQL",
      "Responsive Web Design",
      "Version Control (e.g., Git)",
      "Web Accessibility",
      "Web Security",
      "Performance Optimization"
    ]
  end
end
