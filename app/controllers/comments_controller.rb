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





  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, meeting_id: params[:meeting_id])
  end
end