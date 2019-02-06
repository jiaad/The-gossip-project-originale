class CommentsController < ApplicationController
  def new
     @comment = Comment.new
  end

  def create
    @Comment.new(content: params[:content])
    if @comment.save
    flash[:success] = "ah we t trop fort"
    redirect_to '/gossips/'
    else
      flash[:success] = "NOOOOOOON"
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
