class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy

  mount_uploader :image, ImageUploader

  def up_votes
    votes.where(value: 1).count
  end

  def down_votes
    votes.where(value: -1).count
  end

  def points
    votes.sum(:value)
  end

  def update_rank
    age = (created_at - Time.new(1970,1,1)) / ( 60 * 60 * 24) # 1 day in secs
    new_rank = points + age

    update_attribute(:rank, new_rank)
  end

  default_scope { order('rank DESC')}

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  #validates :topic, presence: true
  #validates :user, presence: true
end
