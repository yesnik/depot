module ApplicationHelper
  def hidden_div_if(hide, html_options={}, &block)
    if hide
      html_options[:class] = 'hide'
    end

    tag.div html_options do
      block.call
    end
  end
end
