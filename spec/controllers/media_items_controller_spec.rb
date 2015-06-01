require 'rails_helper'

RSpec.describe MediaItemsController, type: :controller do

  context 'user not signed in' do
    subject { get :index }
    it { is_expected.to redirect_to new_user_session_path }
  end

  context 'user signed in' do
  end

end
