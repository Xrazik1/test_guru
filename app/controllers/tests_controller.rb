# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[show start]
  before_action :find_user, only: :start

  def index
    @tests = Test.all
  end

  def show; end

  def start
    @user.tests << @test
    redirect_to @user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def find_user
    @user = current_user
  end
end
