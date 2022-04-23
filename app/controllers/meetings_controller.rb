class MeetingsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :show, :edit] 
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def index
    @meetings = Meeting.includes(:user).order("created_at ASC")
  end

  def new 
    @meeting = Meeting.new
    @meeting = current_user.meetings.build
  end

  def create
    @meeting = Meeting.create(meeting_params)
    if @meeting.save
       redirect_to meetings_path
    else
      render "new"
    end
  end

  def show
    @comment = Comment.new
    @comments = @meeting.comments
  end

  def edit
  end

  def update
    if @meeting.update(meeting_params)
      redirect_to meetings_path
    else
      render 'edit'
    end
  end

  def destroy
    if @meeting.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end



  private
  def meeting_params
    params.require(:meeting).permit(:content, :attack, :defence, :attack_url, :defence_url).merge(user_id: current_user.id)
  end

  def set_tweet
    @meeting = Meeting.find(params[:id])
  end
end