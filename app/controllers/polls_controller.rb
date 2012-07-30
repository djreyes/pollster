class PollsController < ApplicationController
  def index
    @polls = Poll.all
  end

  def show
    @poll = Poll.find(params[:id])
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(params[:poll])
    if @poll.save
      flash[:notice] = "You have successfully created a poll!"
      render 'edit'
    else
      render 'new'
    end
  end

  def edit
    @poll = Poll.find_by_admin_link(params[:id])
  end

  def update
  end

  def destroy
  end
end
