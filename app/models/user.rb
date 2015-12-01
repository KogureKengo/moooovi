class User < ActiveRecord::Base
  has_many :reviews
  # ニックネームの入力を必須にする
  validates :nickname, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

# 画像のサイズや保存先、デフォルト画像などを設定できる
# サイズを指定するための属性はstylesです。stylesではどのような種類の画像をどの大きさで保存するか指定します。「medium」や「thumb」はImageMagickで保存できる画像の種類です。
  has_attached_file :avatar,
                      styles:  { medium: "300x300#", thumb: "100x100#" }
# 画像の拡張子を設定可能
  validates_attachment_content_type :avatar,
                                      content_type: ["image/jpg","image/jpeg","image/png"]

end
