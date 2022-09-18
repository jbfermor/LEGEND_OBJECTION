class CommentTypesController < ApplicationController
  
  before_action :set_comment_type, only: %i[ show edit update destroy ]

  # GET /comment_types or /comment_types.json
  def index
    @comment_types = CommentType.all
  end

  # GET /comment_types/1 or /comment_types/1.json
  def show
  end

  # GET /comment_types/new
  def new
    @comment_type = CommentType.new
  end

  # GET /comment_types/1/edit
  def edit
  end

  # POST /comment_types or /comment_types.json
  def create
    @comment_type = CommentType.new(comment_type_params)
    if @comment_type.save
      redirect_to @comment_type, notice: "comment_type was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comment_types/1 or /comment_types/1.json
  def update
    if @comment_type.update(comment_type_params)
      redirect_to @comment_type, notice: "comment_type was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /comment_types/1 or /comment_types/1.json
  def destroy
    @comment_type.destroy
    redirect_to comment_types_url, notice: "comment_type was successfully destroyed." 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_type
      @comment_type = CommentType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_type_params
      params.require(:comment_type).permit(:name)
    end  
end
