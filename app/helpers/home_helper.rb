module HomeHelper
  def generate_category
    Category.all
  end

   def generate_url_link(banner)
    if banner.use_url == true && banner.article_id.blank?
      banner.url
    else
      "http://blog.andy1dx.xyz/articles/#{banner.article_id}"
    end
  end
end
