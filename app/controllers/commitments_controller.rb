class CommitmentsController < ApplicationController
  before_action :set_commitment, only: [:show, :edit, :update, :destroy]

  # GET /commitments
  # GET /commitments.json
  def index
    # @commitments = Commitment.all.where(user_id: current_user.id)
    @commitments = Commitment.search_by_user_id(current_user.id)
    search_date = Time.now.strftime("%Y-%m-%d")
    @today_commitments = Commitment.search_by_date(search_date)
  end

  # GET /commitments/1
  # GET /commitments/1.json
  def show
  end

  # GET /commitments/new
  def new
    @commitment = Commitment.new
  end

  # GET /commitments/1/edit
  def edit
  end

  # POST /commitments
  # POST /commitments.json
  def create
    @commitment = Commitment.new(commitment_params)
    @commitment.user_id = current_user.id

    if @commitment.save
      redirect_to commitments_path
    else
      render 'new'
    end

    # respond_to do |format|
    #   if @commitment.save
    #     format.html { redirect_to @commitment, notice: 'Commitment was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @commitment }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @commitment.errors, status: :unprocessable_entity }
    #   end
    # end

  end

  # PATCH/PUT /commitments/1
  # PATCH/PUT /commitments/1.json
  def update
    if @commitment.update(commitment_params)
      redirect_to commitments_path
    else
      render 'edit'
    end
    # respond_to do |format|
    #   if @commitment.update(commitment_params)
    #     format.html { redirect_to @commitment, notice: 'Commitment was successfully updated.' }
    #     format.json { head :no_content }
    #   else
    #     format.html { render action: 'edit' }
    #     format.json { render json: @commitment.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /commitments/1
  # DELETE /commitments/1.json
  def destroy
    @commitment.destroy
    respond_to do |format|
      format.html { redirect_to commitments_url }
      format.json { head :no_content }
    end
  end

  def toggle
    set_commitment
    @commitment.is_completed = !@commitment.is_completed
    @commitment.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commitment
      @commitment = Commitment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def commitment_params
      params.require(:commitment).permit(:title, :is_completed, :due_date, :status)
    end
end
