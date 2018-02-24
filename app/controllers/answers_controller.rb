class AnswersController < ApplicationController
  before_action :authenticate_user!

  def new
    @question = Question.find(params[:id])
    @answer = current_user.answers.build(question_id: @question.id)
    @feed_answers_items = @question.feed_answers
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      flash[:success] = "Your answer posted!"
      redirect_to request.referrer || root_url
    else
      flash[:error] = "Your answer NOT posted...!!"
      render 'answers/new'
    end
  end

  def destroy
    if current_user
      @answer = current_user.answers.find_by(id: params[:id])
      @answer.destroy
      flash[:success] = "Answer deleted"
      redirect_to request.referrer || root_url
    else
      flash[:error] = "Answer NOT deleted...!"
      redirect_to roo_url
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :user_id, :question_id)
  end
end
