class ArticlesController < ApplicationController
  require "postrank-api"
  
  def show
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      api = PostRank::API.new('db233481d596f23895813487370ed088')
      @metrics = api.metrics(@article.url)
    else
      render 'create'
    end
  end
end
