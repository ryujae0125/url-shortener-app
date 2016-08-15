class Link < ApplicationRecord
  has_many :visits
  belongs_to :user

  validates :slug, presence: true
  validates :target_url, presence: true
  
  def standardize_target_url!
    target_url.gsub!("http://", "")
    target_url.gsub!("https://", "")
  end

  def visit_count
    visits.count
  end
end
