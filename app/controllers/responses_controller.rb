class ResponsesController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @question = Question.find(params[:question_id])
    @question.responses.new(params[:response])
    if @question.save
      flash[:notice] = "You have successfully saved your response for this question!"
    else
      flash[:error] = "There was an error!"
    end

    redirect_to @question
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
