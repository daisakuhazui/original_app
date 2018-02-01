class QuestionsController < ApplicationController
  before_action :authenticate_user!, :set_question

  def index
    @feed_items = current_user.feed
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "Question created!"
      redirect_to root_url
    else
      flash[:error] = "Question NOT created...!"
      render 'questions/index'
    end
  end

  def destroy
    if current_user
      @question = current_user.questions.find_by(id: params[:id])
      @question.destroy
      flash[:success] = "Question deleted"
      redirect_to request.referrer || root_url
    else
      flash[:error] = "Question NOT deleted...!"
      redirect_to root_url
    end
  end

  private

  def question_params
    params.require(:question).permit(:content, :user_id)
  end

  def set_question
    @user = User.find(current_user.id)
    @question = current_user.questions.build(user_id: @user.id)
  end
end
