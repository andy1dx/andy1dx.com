module HomeHelper
  def generate_category
    Category.all
  end

   def generate_url_link(banner)
    if banner.use_url == true && banner.article_id.blank?
      banner.url
    else
      "#{request.base_url}/articles/#{banner.article_id}"
    end
  end
end
