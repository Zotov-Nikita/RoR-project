class PostsController < ApplicationController
    before_action :post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:show]

    def index
    
    	@posts = Post.all

    end

    def show
    end

    def new
         @post = Post.new
	
    end

    def create
        puts params
	#@post=Post.new(post_params)
	#@post.user_id = current_user
        Post.create(post_params)
	#@post = current_user.posts.build(post_params)
        # flash[:notice] = "Post was successfully created"
        redirect_to posts_path, notice: "Post was successfully created"
    end

    def edit
    end

    def update
        @post.assign_attributes(post_params)
        if @post.save
            flash[:notice] = "Post was successfully updated"
        else
            flash[:notice] = "Failing updating post"
        end
        redirect_to post_path(@post)
    end

    def destroy
        @post.destroy
        flash[:notice] = "Post was successfully destroyed"
        redirect_to posts_path
    end

    private
        def post
            @post ||= Post.find(params[:id])
        end

        def post_params
            params.require(:post).permit(:title, :text).merge(user: current_user)
        end

        helper_method :post
end
