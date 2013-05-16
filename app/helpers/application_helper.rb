module ApplicationHelper

  def page_title
    if content_for?(:title)
      yield("#{content_for(:title)} | Marshall Klickman")
    else
      "Marshall Klickman"
    end
  end

  def body_class
    return params[:controller] unless params[:controller] == 'application'
    return params[:action]
  end
end
