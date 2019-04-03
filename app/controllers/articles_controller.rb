class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]
  before_action :validates_params, only: [:create, :update, :destroy]
  #before_action :authenticate_user!, only: [:create]

  # GET /articles
  def index
    @articles = Article.all
    render json: @articles, each_serializer: ArticleSerializer
  end

  # GET /articles/1
  def show
    render json: @article
  end

  # GET /search_articles_by_title
  def autocomplete_by_title
    @articles = ::Autocomplete.new.autocomplete(params[:content], Article, 'title')
    return render json: @articles if @articles != []
  end

  # POST /articles
  def create
    @article = Article.new(article_params)

    if @article.save
      render json: @article, status: :created, location: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end
  # Only allow a trusted parameter "white list" through.

  def article_params
    params.require(:article).permit(:title, :content, :image, :user_id)
  end

  def validates_params
    param! :article, Hash do |b|
      b.param! :title, String
      b.param! :content, String
      b.param! :image, String
      b.param! :vote, Integer
      b.param! :user_id, Integer
    end
  end
end
