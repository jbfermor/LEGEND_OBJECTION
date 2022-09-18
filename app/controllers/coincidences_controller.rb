class CoincidencesController < ApplicationController

  def new
    @coincidence = Coincidence.new
    @people = Person.all
  end

  def create
    person = Person.find(coincidence_params[:person_id])
    comment = Comment.find(params[:comment_id])
    unless comment.people.include?(person)
      @coincidence = Coincidence.new(coincidence_params)
      @coincidence.comment_id = comment.id
      if @coincidence.save
        redirect_to comments_path, notice: "coincidence was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to comments_path, notice: "Ya hay una coincidencia para este comentario de esta persona"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.


    # Only allow a list of trusted parameters through.
    def coincidence_params
      params.require(:coincidence).permit(:description, :comment_id, :person_id)
    end

end
