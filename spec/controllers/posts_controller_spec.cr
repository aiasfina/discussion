require "./spec_helper"

def create_subject
  subject = Posts.new
  subject.title = "test"
  subject.save
  subject
end

describe PostsController do
  Spec.before_each do
    Posts.clear
  end

  describe PostsController::Index do
    it "renders all the postss" do
      subject = create_subject
      get "/postss"
      response.body.should contain "test"
    end
  end

  describe PostsController::Show do
    it "renders a single posts" do
      subject = create_subject
      get "/postss/#{subject.id}"
      response.body.should contain "test"
    end
  end

  describe PostsController::New do
    it "render new template" do
      get "/postss/new"
      response.body.should contain "New Posts"
    end
  end

  describe PostsController::Create do
    it "creates a posts" do
      post "/postss", body: "title=testing"
      subject_list = Posts.all
      subject_list.size.should eq 1
    end
  end

  describe PostsController::Edit do
    it "renders edit template" do
      subject = create_subject
      get "/postss/#{subject.id}/edit"
      response.body.should contain "Edit Posts"
    end
  end

  describe PostsController::Update do
    it "updates a posts" do
      subject = create_subject
      patch "/postss/#{subject.id}", body: "title=test2"
      result = Posts.find(subject.id).not_nil!
      result.title.should eq "test2"
    end
  end

  describe PostsController::Delete do
    it "deletes a posts" do
      subject = create_subject
      delete "/postss/#{subject.id}"
      result = Posts.find subject.id
      result.should eq nil
    end
  end
end
