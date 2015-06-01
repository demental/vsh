require 'rails_helper'

RSpec.describe Attachment, type: :model do
  describe 'Associations' do
    subject { build :attachment }
    it { is_expected.to respond_to :media_container }
  end

  describe 'Uploading a media to the right path' do
    let(:user) { create(:user) }
    let(:media_container) { create(:media_container, user: user, kind:'image') }
    subject { create :attachment, file: image_file, media_container: media_container }
    it 'saves to a user related path' do
      expect(subject.file.path).to match "/attachment/#{user.id}/image/#{media_container.id}/image.png"
    end
  end

  describe '#user_id' do
    let(:user) { create(:user) }
    let(:media_container) { create(:media_container, user: user, kind:'image') }
    subject { create :attachment, media_container: media_container }
    it 'returns the user ID' do
      expect(subject.user_id).to eq user.id
    end
  end

  private

  def image_file
    File.open(Rails.root.join('spec','fixtures','image.png'))
  end
end
