module ApplicationHelper
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes['style'] = 'display:none'
    end
    content_tag('div', attributes, &block)
  end

  # Define if this page is current
  def cp(path)
    "current" if current_page?(path)
  end
end
