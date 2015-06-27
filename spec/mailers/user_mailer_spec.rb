require 'spec_helper'
require 'spree/user_mailer'

describe Spree::UserMailer do
  let(:user) { FactoryGirl.create(:user) }

  context "reset password instructions email" do
    let(:email) { Spree::UserMailer.reset_password_instructions(user, user.reset_password_token) }

    it 'renders an HTML email' do
      expect(email.content_type).to match("text/html")
    end
  end
end
