class CoincidencesController < ApplicationController
  before_action :set_coincidence, only: [:edit, :update, :destroy]

  def new
    @coincidence = Coincidence.new
    @people = Person.all
  end

  def create
    person = Person.find(coincidence_params[:person_id])
    comment = Comment.find(params[:comment_id])
    if comment.coincidences.find_by(person_id: person.id)
      redirect_to comments_path, notice: "Ya ha uno."
    else
      @coincidence = Coincidence.new(coincidence_params)
      @coincidence.comment_id = comment.id
      if @coincidence.save
        redirect_to comments_path, notice: "coincidence was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def edit
    @people = Person.all
  end

  def update
    if @coincidence.update(coincidence_params)
      redirect_to comments_path, notice: "coincidence was successfully created."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @coincidence.destroy
    redirect_to comments_path, notice: "Destrucción completada."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coincidence
      @coincidence = Coincidence.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def coincidence_params
      params.require(:coincidence).permit(:description, :comment_id, :person_id)
    end

end
