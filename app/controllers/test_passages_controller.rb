# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result]

  def show; end
  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    @test_passage.completed? ? redirect_to(result_test_passage_path(@test_passage)) : render(:show)
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end