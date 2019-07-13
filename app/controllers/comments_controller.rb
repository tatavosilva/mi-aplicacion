class CommentsController < ApplicationController
    def create
        post = Post.find(params[:post_id])
        comment = post.comments.new(comment_params)
        comment.user_id = current_user.id
        if post.save
            redirect_to post_path(post)    
        else
            flash[:errors] = post.errors.messages
            redirect_to root_path
        end
    end
    
    def destroy 
        p params
    end

private

    def comment_params
        params.require(:comment).permit(:description)
    end
end
