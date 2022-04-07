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
    link = Link.new
    link.title = "Google"
    link.href = "https://google.com"
    assert_raise(ActiveRecord::RecordNotUnique) {link.save}
  end

  test "should populate title" do
    link = Link.find_or_create_new_using_href("https://amiriskandar.com")
    assert_equal link.title, "Amir Iskandar"
  end

  test "should not create new link for same href" do
    link1 = Link.find_by_href("https://google.com")
    link2 = Link.find_or_create_new_using_href("https://google.com")
    assert_equal link1.id, link2.id
  end
end
