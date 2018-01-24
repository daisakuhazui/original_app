class AnswersController < ApplicationController
  before_action :authenticate_user!

  def new
    @question = Question.find(params[:id])
    @answer = current_user.answers.build(user_id: current_user.id, question_id: @question.id)
    @feed_answers_items = @question.feed_answers
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      flash[:success] = "Your answer posted!"
      redirect_to root_url
    else
      render 'answers/new'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :user_id, :question_id)
  end
end
