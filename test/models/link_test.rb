require "test_helper"

class LinkTest < ActiveSupport::TestCase
  test "should save normally" do
    link = Link.new
    link.title = "fixture-test-norm"
    link.href = "https://fixture-test-norm.com"
    assert link.save
  end

  test "should not save without title" do
    link = Link.new
    link.href = "https://fixture-test-title.com"
    assert_raise(ActiveRecord::NotNullViolation) {link.save}
  end

  test "should not save without href" do
    link = Link.new
    link.title = "fixture-test-2-1"
    assert_raise(ActiveRecord::NotNullViolation) {link.save}
  end

  test "should not save without title and href" do
    link = Link.new
    assert_raise(ActiveRecord::NotNullViolation) {link.save}
  end

  test "should not have duplicate href" do
    link1 = Link.new
    link1.title = "fixture-test-2-1"
    link1.href = "https://fixture-test-2.com"
    link1.save

    link2 = Link.new
    link2.title = "fixture-test-2-2"
    link2.href = "https://fixture-test-2.com"
    assert_raise(ActiveRecord::RecordNotUnique) {link2.save}
  end

  test "should populate title" do
    link = Link.find_or_create_new_using_href("https://google.com")
    assert_equal link.title, "Google"
  end

  test "should not create new link for same href" do
    link1 = Link.find_or_create_new_using_href("https://google.com")
    link2 = Link.find_or_create_new_using_href("https://google.com")
    assert_equal link1.id, link2.id
  end
end
