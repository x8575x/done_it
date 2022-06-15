class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # ゲストログイン用 
  def self.guest
    find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com', birthday: '1990-01-01', sex: 'flse') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :wants, dependent: :destroy
  has_many :reads, dependent: :destroy
  has_many :readings, dependent: :destroy
  has_many :gets, dependent: :destroy


  # フォロー・フォロワーのアソシエーション
  has_many :follow_relationships, class_name: "FollowRelationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_follow_relationships, class_name: "FollowRelationship", foreign_key: "followed_id", dependent: :destroy

  # Viewで使用する参照カラム指定
  has_many :followings, through: :follow_relationships, source: :followed
  has_many :followers, through: :reverse_of_follow_relationships, source: :follower


  # ユーザープロフィール画像に関する記述
  has_one_attached :profile_image

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end



  # フォローしたときの処理
  def follow(user_id)
    follow_relationships.create(followed_id: user_id)
  end
  # フォローを外すときの処理
  def unfollow(user_id)
    follow_relationships.find_by(followed_id: user_id).destroy
  end
  # フォローしているか判定
  def following?(user)
    followings.include?(user)
  end

end
