require "rails_helper"

RSpec.describe OrderMailer, type: :mailer do
  let(:order) { create :order }

  describe "received" do
    let(:mail) { OrderMailer.received(order) }

    it "renders the headers" do
      expect(mail.subject).to eq('Pragmatic Store Order Confirmation')
      expect(mail.to).to eq([order.email])
      expect(mail.from).to eq(['admin@depot.com'])
    end

    it "renders the body" do
      expect(mail.body.encoded).
        to match('Thank you for your recent order')
    end
  end

  describe "shipped" do
    let(:mail) { OrderMailer.shipped(order) }

    it "renders the headers" do
      expect(mail.subject).to eq('Pragmatic Store Order Shipped')
      expect(mail.to).to eq([order.email])
      expect(mail.from).to eq(['admin@depot.com'])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("we've shipped your recent order")
    end
  end

end
