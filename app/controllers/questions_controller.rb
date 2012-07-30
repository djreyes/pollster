class QuestionsController < ApplicationController
  def index
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
  end

  def create
    @poll = Poll.find(params[:poll_id])
    @poll.questions.new(params[:question])
    if @poll.save
      flash[:notice] = "You have successfully created a question for this poll!"
    else
      flash[:error] = "There was an error!"
    end

    redirect_to edit_poll_path(@poll.admin_link)
  end

  def edit
    @poll = Poll.find_by_admin_link(params[:poll_id])
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(params[:question])
      flash[:notice] = "You have successfully modified the question!"
      redirect_to edit_poll_question_path
    else
      flash[:error] = "There was an error!"
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    poll = @question.poll
    if @question.destroy
      flash[:notice] = "You have successfully deleted the question!"
      redirect_to edit_poll_path(poll.admin_link)
    else
      flash[:error] = "There was an error!"
      render :edit
    end
  end
end
