require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#navigation_partial' do

    subject { helper.navigation_partial }
    context 'User is signed in' do
      before { allow(helper).to receive(:user_signed_in?).and_return true }
      it { is_expected.to eq 'layouts/navigation_signedin' }
    end

    context 'User is not signed in' do
      before { allow(helper).to receive(:user_signed_in?).and_return false }
      it { is_expected.to eq 'layouts/navigation_anon' }
    end
  end
end
