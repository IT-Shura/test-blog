class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource only: [:approve, :decline, :destroy]

  def create
    @comment        = Comment.new(comment_params)
    @comment.author = current_user
    if verify_recaptcha(model: @comment) && @comment.save
      redirect_to @comment.post, notice: t('comments.created')
    else
      redirect_to @comment.post, notice: @comment.errors.full_messages.each.collect { |m| m } 
    end
  end

  def update
  end

  def approve
  end
  
  def decline
  end
  
  def destroy
  end  

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :captcha, :captcha_key)
  end
end
