require File.dirname(__FILE__) + '/test_helper'
require "friendly_id/tasks"
require "mocha"

class TasksTest < Test::Unit::TestCase

  context "FriendlyId tasks" do

    should "parse a top-level class name and return a class" do
      assert_equal String, FriendlyId::Tasks.parse_class_name("String")
    end

    should "parse a namespaced class name and return a class" do
      assert_equal Test::Unit, FriendlyId::Tasks.parse_class_name("Test::Unit")
    end

  end

  context "The 'make slugs' task" do

    setup do
      City.create! :name => "Buenos Aires"
      City.create! :name => "Rio de Janeiro"
      City.create! :name => "Tokyo"
      City.create! :name => "Nairobi"
      Slug.delete_all
    end

    teardown do
      City.delete_all
      Slug.delete_all
    end

    should "make one slug per model" do
      assert_equal 0, Slug.count
      FriendlyId::Tasks.make_slugs("City")
      assert_equal 4, Slug.count
    end

  end

  context "The 'delete_slugs_for' task" do

    setup do
      @post = Post.create! :title => "Slugs Considered Harmful"
      @city = City.create! :name => "Buenos Aires"
    end

    teardown do
      Post.delete_all
      City.delete_all
      Slug.delete_all
    end

    should "Delete only slugs for the specified model" do
      assert_equal 2, Slug.count
      FriendlyId::Tasks.delete_slugs_for("City")
      assert_equal 1, Slug.count
    end

    should "set the cached_slug column to NULL" do
      FriendlyId::Tasks.delete_slugs_for("City")
      @city.reload
      assert_nil @city.my_slug
    end

  end

  context "The 'delete_old_slugs' task" do

    setup do
      @post = Post.create! :title => "Slugs Considered Harmful"
      @city = City.create! :name => "Buenos Aires"
      City.connection.execute "UPDATE slugs SET created_at = '%s' WHERE id = %d" % [
        45.days.ago.strftime("%Y-%m-%d"), @city.slug.id]
      @city.name = "Ciudad de Buenos Aires"
      @city.save!
    end

    teardown do
      Post.delete_all
      City.delete_all
      Slug.delete_all
    end

    should "delete slugs older than 45 days by default" do
      assert_equal 3, Slug.count
      FriendlyId::Tasks.delete_old_slugs
      assert_equal 2, Slug.count
    end

    should "respect the days argument" do
      assert_equal 3, Slug.count
      FriendlyId::Tasks.delete_old_slugs(100)
      assert_equal 3, Slug.count
    end

    should "respect the class argument" do
      assert_equal 3, Slug.count
      FriendlyId::Tasks.delete_old_slugs(1, "Post")
      assert_equal 3, Slug.count
    end

  end

end
