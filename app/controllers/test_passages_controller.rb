# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end
  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      # TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to(result_test_passage_path(@test_passage))
    else
      render(:show)
    end
  end

  def gist
    gist_service = GistQuestionService.new(@test_passage.current_question)
    response = gist_service.call

    if gist_service.success?
      gist = current_user.gists.create(
        question: @test_passage.current_question,
        url: response.data.url
      )

      gist.save
      flash_options = { notice: t('.success', link: response.data.url) }
    else
      flash_options = { notice: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
