class Admin::QuestionsController < Admin::BaseController
  
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[destroy show edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render json: { questions: @test.questions }
  end

  def show
  end

  def new
    @question = @test.questions.new
  end

  def edit 
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to admin_test_path(@test)
    else
      render :new
    end
    
  end

  def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy

    redirect_to admin_test_path(@question.test)
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
