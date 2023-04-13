class Book < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 200}
  belongs_to :user

  def get_profile_image
    unless image.attached?
      file_path = Rails_root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
end
