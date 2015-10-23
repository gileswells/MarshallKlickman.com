module SiteHelper

  def page_title
    if content_for?(:title)
      yield("#{content_for(:title)} | Marshall Klickman")
    else
      "Marshall Klickman"
    end
  end

  def body_class

    class_string = []
    
    class_string << params[:controller] unless params[:controller] == 'site'
    class_string << params[:action]

    return class_string.join(" ")
  end

  def age
    origin = DateTime.new(1985,8,12)
    result = (Time.now - origin)/60/60/24/365
    number_with_precision(result, :precision => 2)
  end

  def apparent_age
    age.to_i - 11;
  end

  def years_married
    origin = DateTime.new(2006,06,17)
    result = (Time.now - origin)/60/60/24/365
    number_with_precision(result, :precision => 2)
  end
end
