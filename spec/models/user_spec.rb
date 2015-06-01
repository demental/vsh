require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Associations' do
    subject { User.new }
    it { is_expected.to respond_to :media_containers }
  end
end
