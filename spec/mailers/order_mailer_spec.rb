require 'spec_helper'

describe Spree::OrderMailer do
  let(:order) { create(:order,
                        completed_at: Time.now,
                        bill_address: FactoryGirl.create(:address),
                        ship_address: FactoryGirl.create(:address)) }

  context "confirmation email" do
    let(:email) { Spree::OrderMailer.confirm_email(order) }

    it 'renders an html email' do
      expect(email.content_type).to match("text/html")
    end
  end

  context "cancelation email" do
    let(:email) { Spree::OrderMailer.cancel_email(order) }

    it 'renders an html email' do
      expect(email.content_type).to match("text/html")
    end
  end
end
