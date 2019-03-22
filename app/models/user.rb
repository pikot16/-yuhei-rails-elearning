class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :lessons, dependent: :destroy
  validates :name, presence:true, length: { maximum:25, minimum:2 }
  
  before_save { email.downcase! }
  #Email Regular Expression
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i  # iv-a.n@gmail.com @hot-mail.com
  # /..ここから始まる　\A..A-Z or 0_9から始まっていい　[\w+..どんなletter,numberで終わってもいい \-.]..　- も .も受け付ける　@..@を持っていないとダメ　a-z...@の後はletter か-でないとダメ
  validates :email, presence: true, length: { maximum:50 },
                                    format: { with: EMAIL_REGEX },
                                    uniqueness: { case_sensitive:false }

  has_secure_password
  validates :password, length: { minimum: 6 }, allow_nil: true
  validates :agreement, acceptance: true
  
  has_many :active_relationships,  class_name:  "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  # ユーザーをフォローする
  def follow(other_user)
    following << other_user
  end

  # ユーザーをフォロー解除する
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy # AwesomeBlogと書き方違う
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end  
end
