class PostsController < ApplicationController
    before_action :set_post,only:[:show]
    def index
        
    end
    def new
        @post = Post.new
    end
    def create
        @post = Post.new(post_params)
        @post.user = current_user
        if @post.save
            flash[:success] = "The post is successfully created."
            redirect_to post_path(@post)
        else
            flash[:danger] = "The post failed to be created."
            render 'new'
        end
    end
    
    def show
        
    end
    
    private
    def post_params
        params.require(:post).permit(:date,:rationale)
    end
    
    def set_post
        @post = Post.find(params[:id])
    end
end
