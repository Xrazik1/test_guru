# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController
  before_action :find_tests, only: %i[index update_inline]
  before_action :find_test, only: %i[show start destroy update edit update_inline]

  def index
    @tests = Test.all
  end

  def show; end

  def start
    current_user.tests << @test
    redirect_to current_user.test_passage(@test)
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.author_tests.new(test_params)
    @test.save ? redirect_to(admin_test_url(@test)) : render(:new)
  end

  def update
    @test.update(test_params) ? redirect_to(admin_test_url(@test)) : render(:edit)
  end

  def update_inline
    @test.update(test_params) ? redirect_to(admin_tests_path) : render(:index)
  end

  def destroy
    @test.destroy
    redirect_to(admin_tests_url)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def find_tests
    @tests = Test.all
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
