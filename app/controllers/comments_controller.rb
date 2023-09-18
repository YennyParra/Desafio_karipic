class CommentsController < ApplicationController
    before_action :set_comment, only: %i[ show edit update destroy ]
    before_action :authenticate_user!, except: %i[ show ] 
    
    # GET /comments/1/edit
    def edit
    end
  

    # POST /comments or /comments.json
    def index 
      @commets = Comment.all
    end  
    #Get/comments/1 or/comments/1.json
    def show
     #@comment = Comment.find(params[:id]) 
    end


    # GET /comments/new
    def new
      @comment = Comment.new
    
    # POST /comments or /comments.json 
    def create
        @photo = Photo.find(params[:comment][:photo_id])
        @comment = Comment.new(comment_params)
        if user_signed_in? 
          @comment.user = current_user
        end
        
      respond_to do |format|
        if @comment.save
          format.html { redirect_to photo_path(@photo.id), notice: "Comment was successfully created." }
          format.json { render :show, status: :created, location: @comment }
        else
          Rails.logger.debug "Comment errors: #{@comment.errors.full_messages}"
          format.html { redirect_to photo_path(@photo.id), notice: "Comment wasn't created." }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    end
  
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_comment
        @comment = Comment.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
    def comment_params
        params.require(:comment).permit(:content, :photo_id, :user_id)
    end
  


