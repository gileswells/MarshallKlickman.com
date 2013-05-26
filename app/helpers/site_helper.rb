module SiteHelper

  def page_title
    if content_for?(:title)
      yield("#{content_for(:title)} | Marshall Klickman")
    else
      "Marshall Klickman"
    end
  end

  def body_class
    return params[:controller] unless params[:controller] == 'site'
    return params[:action]
  end

  def years_married
    origin = DateTime.new(2006,06,17)
    result = (Time.now - origin)/60/60/24/365
    number_with_precision(result, :precision => 2)
  end
end
