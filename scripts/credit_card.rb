# We can run this script via:
#   rails runner scripts/credit_card.rb

require 'active_merchant/billing/rails'

credit_card = ActiveMerchant::Billing::CreditCard.new(
  number: '5438168958593861',
  month: '8',
  year: '2009',
  first_name: 'Tobias',
  last_name: 'Luetke',
  verification_value: '123'
)

puts "Is #{credit_card.number} valid? #{credit_card.valid?}"
