class Topic < ApplicationRecord
  validates :name, presence: true
  validates :rule, presence: true
  validates :question, presence: true
  validates :category, presence: true

  CATEGORIES = %w[数学 物理 生物 コンピューターサイエンス 食の科学 建築 歴史・文献 言語 行動・社会].freeze

  has_many :prescriptions
end
