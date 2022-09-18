class CommentsController < ApplicationController
  before_action :set_comment, except: %i[ index new create ]
  before_action :find_mmy, only: %i[ create ]

  # GET /comments or /comments.json
  def index
    @objections = Comment.all.where comment_type_id: 3
    @goods = Comment.all.where comment_type_id: 1
    @comments = Comment.all
    @coincidence = Coincidence.new
    @people = Person.all
  end

  # GET /comments/1 or /comments/1.json
  def show
    @zones = Zone.all
  end

  # GET /comments/new
  def new
    @comment = Comment.new
    @comment_types = CommentType.all
    @zones = Zone.all
    @people = Person.all

  end

  # GET /comments/1/edit
  def edit
    @comment_types = CommentType.all
    @zones = Zone.all
    @people = Person.all
  end

  # POST /comments or /comments.json
  def create
    @comment = Comment.new(
      title: comment_params[:title],
      description: comment_params[:description],
      comment_type_id: comment_params[:comment_type_id]
    )
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

  def coincidence
    comment = Comment.find(params[:comment_id])
    person = Person.find(params[:person_id])
    if comment.people.includes?(person)
      redirect_to comments_url, notice: "Esta persona ya se añadió"
    else
      comment.people << person
    end
    redirect_to comments_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:title, :description, :number, :comment_type_id, :person_id)
    end

    def find_mmy
      @zone = Zone.find_by(id: params[:zone].presence)
      @person = Person.find_by(id: params[:person].presence)
    end
end
