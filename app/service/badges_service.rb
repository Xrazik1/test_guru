# frozen_string_literal: true

class BadgesService
  def initialize(test_passage)
    @test_passage = test_passage
    @user         = @test_passage.user
    @badges       = Badge.all
  end

  def handle_badges
    @badges.each do |badge|
      @user.badges << badge if send "#{badge.rule.title}_badge?", badge.rule
    end
  end

  private

  def attempt_badge?(rule)
    @user.tests.where(id: @test_passage.test_id).count == rule.attempt && @test_passage.successfully_passed
  end

  def category_badge?(rule)
    return false if Test.by_cat_name(rule.title).count.zero?

    Test.by_cat_name(rule.title).count == @user.successfully_tests.by_cat_name(rule.title).count
  end

  def level_badge?(rule)
    return false if Test.where(level: rule.level).count.zero?

    @user.successfully_tests.where(level: rule.level).count == Test.where(level: rule.level).count
  end
end
