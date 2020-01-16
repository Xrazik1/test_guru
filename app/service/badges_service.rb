# frozen_string_literal: true

class BadgesService
  def initialize(test_passage)
    @test_passage = test_passage
    @user         = @test_passage.user
    @badge_rules  = BadgeRule.all
  end

  def look_for_badges
    followed_rules.map(&:badges)&.flatten
  end

  private

  def followed_rules
    rules = []
    @badge_rules.each { |rule| rules << rule if execute_checks(rule) }
    rules
  end

  def execute_checks(rule)
    checks = []
    checks << check_attempt(rule.attempt) if rule.attempt_badge
    checks << check_category(rule.category.title) if rule.category_badge
    checks << check_level(rule.level) if rule.level_badge

    checks.include? true
  end

  def check_attempt(attempt)
    @user.tests.where(id: @test_passage.test_id).count == attempt && @test_passage.successfully_passed
  end

  def check_category(title)
    return false if Test.by_cat_name(title).count.zero?

    Test.by_cat_name(title).count == @user.successfully_tests.by_cat_name(title).count
  end

  def check_level(level)
    return false if Test.where(level: level).count.zero?

    @user.successfully_tests.where(level: level).count == Test.where(level: level).count
  end
end
