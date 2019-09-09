module Admins::ArticlesHelper
  def get_prev_articles(article)
  	prev_id = article.id - 1 unless article.id == 1 
  	Article.find(prev_id) if Article.exists?(id: prev_id)
  end

  def get_next_articles(article)
  	next_id = article.id + 1
  	nil
  	Article.find(next_id) if Article.exists?(id: next_id)
  end
end
