class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all.with_rich_text_description
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
    @comment_types = CommentType.all
    @people = Person.all
  end

  # GET /comments/1/edit
  def edit
    @comment_types = CommentType.all
    @people = Person.all
  end

  # POST /comments or /comments.json
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to @comment, notice: "comment was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: "comment was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy
    redirect_to comments_url, notice: "comment was successfully destroyed." 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:title, :description, :comment_type_id, :person_id)
    end
end
