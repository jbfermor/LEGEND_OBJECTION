class PeopleController < ApplicationController
  before_action :set_person, only: %i[ show edit update destroy ]

  # GET /people or /people.json
  def index
    @people = Person.all.order(:zone_id)
  end

  # GET /people/1 or /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
    @zones = Zone.all
  end

  # GET /people/1/edit
  def edit
    @zones = Zone.all
  end

  # POST /people or /people.json
  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to comments_path, notice: "person was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    if @person.update(person_params)
      redirect_to @person, notice: "person was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    @person.destroy
    redirect_to people_url, notice: "person was successfully destroyed." 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:name, :zone_id)
    end
end
