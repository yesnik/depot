module ApplicationHelper
  EXCHANGE_RATES = {
    ru: 58.2
  }

  def hidden_div_if(hide, html_options={}, &block)
    if hide
      html_options[:class] = 'hide'
    end

    tag.div html_options do
      block.call
    end
  end

  def localized_price(price)
    price = price * EXCHANGE_RATES[I18n.locale.to_sym] if I18n.locale != :en
    number_to_currency(price, delimiter: ' ')
  end
end
