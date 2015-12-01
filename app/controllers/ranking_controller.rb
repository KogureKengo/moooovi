class RankingController < ApplicationController
  before_action :ranking

  def ranking
    ranking_ids = Review.group(:product_id).order('count_product_id DESC').limit(5).count(:product_id).keys
    # @ranking = Product.order('id ASC').limit(5)
    # rankingは配列。各要素のidをfindで検索しレコードを代入している
    @ranking = ranking_ids.map { |id| Product.find(id) }
  end

  layout 'review_site'
end
