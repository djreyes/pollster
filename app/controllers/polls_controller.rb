class PollsController < ApplicationController
  def index
    @polls = Poll.all
  end

  def show
  end

  def new
    @poll = Poll.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
