class CommentsController < ApplicationController
 
      
      def create
        @trail = Trail.find(params[:trail_id])
        @comment = @trail.comments.new(comment_params)
      
        if @comment.save!
          flash[:success] = 'Your comment was successfully added!'
          redirect_to trail_path(@trail)
        else
          flash[:notice] = "Error creating comment: #{@comment.errors}"
          redirect_to trail_path(@trail)
        end
      end

      
 private
 


 def comment_params
    params.require(:comment).permit(:body, :user_id, :trail_id, user_attributes:[:username])
  
 end 
end 