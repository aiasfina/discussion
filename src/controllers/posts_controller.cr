class PostsController < ApplicationController 
  def index
    postss = Posts.all
    render("index.slang")
  end

  def show
    if posts = Posts.find params["id"]
      render("show.slang")
    else
      flash["warning"] = "Posts with ID #{params["id"]} Not Found"
      redirect_to "/postss"
    end
  end

  def new
    posts = Posts.new
    render("new.slang")
  end

  def create
  posts = Posts.new(params.to_h.select(["title", "body"]))

    if posts.valid? && posts.save
      flash["success"] = "Created Posts successfully."
      redirect_to "/postss"
    else
      flash["danger"] = "Could not create Posts!"
      render("new.slang")
    end
  end

  def edit
    if posts = Posts.find params["id"]
      render("edit.slang")
    else
      flash["warning"] = "Posts with ID #{params["id"]} Not Found"
      redirect_to "/postss"
    end
  end

  def update
    if posts = Posts.find(params["id"])
      posts.set_attributes(params.to_h.select(["title", "body"]))
      if posts.valid? && posts.save
        flash["success"] = "Updated Posts successfully."
        redirect_to "/postss"
      else
        flash["danger"] = "Could not update Posts!"
        render("edit.slang")
      end
    else
      flash["warning"] = "Posts with ID #{params["id"]} Not Found"
      redirect_to "/postss"
    end
  end

  def destroy
    if posts = Posts.find params["id"]
      posts.destroy
    else
      flash["warning"] = "Posts with ID #{params["id"]} Not Found"
    end
    redirect_to "/postss"
  end
end
