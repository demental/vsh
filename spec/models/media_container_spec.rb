require 'rails_helper'

RSpec.describe MediaContainer, type: :model do

  describe '#associations' do
    subject { MediaContainer.new }
    it {is_expected.to respond_to :user }

  end
end
