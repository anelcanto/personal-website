class BlogPostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_blog_post, only: %i[show edit update destroy]

  # GET /blog_posts or /blog_posts.json
  def index
    @blog_posts = BlogPost.published
    redirect_to root_path, notice: 'No blog posts found' if @blog_posts.empty?
  end

  def my_posts
    @blog_posts = current_user.blog_posts
  end

  # GET /blog_posts/1 or /blog_posts/1.json
  def show
    @blog_posts = BlogPost.published
  end

  # GET /blog_posts/new
  def new
    @blog_post = BlogPost.new
  end

  # GET /blog_posts/1/edit
  def edit; end

  # POST /blog_posts or /blog_posts.json
  def create
    @blog_post = BlogPost.new(blog_post_params)
    @blog_post.author = current_user

    respond_to do |format|
      if @blog_post.save
        format.html { redirect_to blog_post_url(@blog_post), notice: 'Blog post was successfully created.' }
        format.json { render :show, status: :created, location: @blog_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blog_posts/1 or /blog_posts/1.json
  def update
    respond_to do |format|
      if @blog_post.update(blog_post_params)
        format.html { redirect_to blog_post_url(@blog_post), notice: 'Blog post was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blog_posts/1 or /blog_posts/1.json
  def destroy
    @blog_post.destroy!

    respond_to do |format|
      format.html { redirect_to my_posts_url, notice: 'Blog post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_blog_post
    @blog_post = BlogPost.published.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, notice: 'Blog post not found'
  end

  # Only allow a list of trusted parameters through.
  def blog_post_params
    params.require(:blog_post).permit(:title, :published_at, :content, :image)
  end
end
