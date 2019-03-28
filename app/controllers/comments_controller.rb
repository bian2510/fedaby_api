class CommentsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
  before_action :validates_params, only: [:create, :update, :destroy]
  before_action :set_comment, only: [:show, :update, :destroy]
  def index
    @comments = Article.find(params[:article_id]).comment
    return render json: [] if @comments == nil
    render json: @comments
  end

  def show
    render json: @comment
  end

  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :article_id, :body)
  end

  def validates_params
    param! :comment, Hash do |b|
      b.param! :user_id, Integer
      b.param! :article_id, Integer
      b.param! :body, String
      b.param! :vote, Integer
    end
  end
end