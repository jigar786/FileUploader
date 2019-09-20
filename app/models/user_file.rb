class UserFile < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :user
  validates :user_id, presence: true
  validates :file_name, presence: true
  mount_uploader :file_name, FilesUploader
end
