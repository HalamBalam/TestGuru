class QuestionsController < ApplicationController
  
  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[destroy show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render json: { questions: @test.questions }
  end

  def show
    render file: '/app/views/questions/show.html.erb'
  end

  def new
    render file: '/app/views/questions/new.html.erb' 
  end

  def create
    question = @test.questions.new(question_params)

    if question.save
      render plain: "Создан вопрос: #{question.inspect}"
    else
      render plain: question.errors.full_messages
    end
    
  end

  def destroy
    @question.destroy

    render plain: 'Question was deleted'
  end

  private

  def question_params
    params.require(:question).permit(:body)  
  end

  def find_test
    @test = Test.find(params[:test_id])  
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
    404
  end
end
