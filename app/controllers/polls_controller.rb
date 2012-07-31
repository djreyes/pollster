class PollsController < ApplicationController
  def index
    @polls = Poll.all
  end

  def show
    @poll = Poll.find(params[:id])
    @responses = []
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(params[:poll])
    if @poll.save
      flash[:notice] = "You have successfully created a poll!"
      @question = Question.new
      redirect_to edit_poll_path(@poll.admin_link)
    else
      render 'new'
    end
  end

  def edit
    @poll = Poll.find_by_admin_link(params[:id])
    @question = Question.new
  end

  def update
  end

  def destroy
  end
end
