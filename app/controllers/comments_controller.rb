class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :approve, :decline, :update, :destroy]
  load_and_authorize_resource only: [:approve, :decline, :destroy]
  respond_to :json

  def create
    @comment        = Comment.new(comment_params)
    @comment.author = current_user
    if @comment.save && check_captcha
      redirect_to @comment.post, notice: t('comments.created')
    else
      redirect_to @comment.post, notice: @comment.errors.full_messages.each.map { |m| m } 
    end
  end

  def update
  end

  def approve
    @comment.approve!
    respond_with(@comment)
  end
  
  def decline
    @comment.decline!
    respond_with(@comment)
  end
  
  def destroy
    path = post_path(@comment.post)
    @comment.destroy
    redirect_to path, notice: t('comments.deleted')
  end  

  private
  
  def set_comment
    @comment = Comment.find(params[:id])
  end
  
  def check_captcha
    verify_recaptcha(model: @comment) || current_user.has_role?(:registered_user)
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id, :captcha, :captcha_key)
  end
end
