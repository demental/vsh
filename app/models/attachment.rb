class Attachment < ActiveRecord::Base
  belongs_to :media_container

  mount_uploader :file, AttachmentUploader, mount_on: :file

  def user_id
    @user_id ||= media_container.user_id
  end

end
