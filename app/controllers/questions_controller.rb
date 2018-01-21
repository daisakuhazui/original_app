class QuestionsController < ApplicationController
  before_action :authenticate_user!, :set_question
  before_action :correct_user, only: :destroy

  def index
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "Question created!"
      redirect_to root_url
    else
      render 'questions/index'
    end
  end

  def destroy
    @question.destroy
    flash[:success] = "Question deleted"
    redirect_to request.referrer || root_url
  end

  private

  def question_params
    params.require(:question).permit(:content, :user_id)
  end

  def set_question
    @user = User.find(current_user.id)
    @question = current_user.questions.build(user_id: @user.id)
  end

  def correct_user
    @question = current_user.questions.find_by(id: params[:id])
    redirect_to root_url if @question.nil?
  end
end
