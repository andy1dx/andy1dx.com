module Admins::BannersHelper
  def generate_url(banner)
    if banner.use_url == true && banner.article_id.blank?
      link_to banner.url, banner.url
    else
      link_to "#{request.base_url}/articles/#{banner.article_id}", "#{request.base_url}/articles/#{banner.article_id}"
    end
  end
end
