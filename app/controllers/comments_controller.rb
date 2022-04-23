class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to meeting_path(@comment.meeting)
    else
      @meeting = @comment.meeting
      @comments = @meeting.comments
      render "meetings/show"
    end
  end

  def destroy
    @meeting = Meeting.find(params[:meeting_id])
    @comment = Comment.find(params[:id])
     if user_signed_in? && @comment.user_id == current_user.id
       @comment.destroy
       redirect_to root_path
      else
        redirect_to posts_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, meeting_id: params[:meeting_id])
  end
end