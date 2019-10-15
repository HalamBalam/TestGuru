class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      if @test_passage.test_passed?
        BadgeGettingService.new(current_user, @test_passage).give_badges
      end
      
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.id?
      gist = Gist.new
      gist.user = current_user
      gist.question = @test_passage.current_question
      gist.url = result.html_url
      gist.save!

      flash_options = { notice: t('.success', url: result.html_url) }
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
