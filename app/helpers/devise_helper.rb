module DeviseHelper
  def new_devise_error_messages!(attribute)
    return "" if resource.errors.empty?
    messages = resource.errors.full_messages_for(attribute.to_sym).each { |msg| content_tag(:li, msg) }.join

    html = <<-HTML
    <div id="error_explanation">
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end

  def devise_error_messages!
    return "" if resource.errors.empty?
    sentence = I18n.t("errors.messages.not_saved",
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation">
      <h2>#{sentence}</h2>
    </div>
    HTML

    html.html_safe
  end
end