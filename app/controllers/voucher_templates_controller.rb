class VoucherTemplatesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_voucher_template, only: %i[ show edit update destroy ]

  # GET /voucher_templates or /voucher_templates.json
  def index
    @voucher_templates = VoucherTemplate.all
  end

  # GET /voucher_templates/1 or /voucher_templates/1.json
  def show
  end

  # GET /voucher_templates/new
  def new
    @voucher_template = VoucherTemplate.new
  end

  # GET /voucher_templates/1/edit
  def edit
  end

  # POST /voucher_templates or /voucher_templates.json
  def create
    @voucher_template = VoucherTemplate.new(voucher_template_params)

    respond_to do |format|
      if @voucher_template.save
        format.html { redirect_to voucher_template_url(@voucher_template), notice: "Voucher template was successfully created." }
        format.json { render :show, status: :created, location: @voucher_template }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @voucher_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /voucher_templates/1 or /voucher_templates/1.json
  def update
    respond_to do |format|
      if @voucher_template.update(voucher_template_params)
        format.html { redirect_to voucher_template_url(@voucher_template), notice: "Voucher template was successfully updated." }
        format.json { render :show, status: :ok, location: @voucher_template }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @voucher_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voucher_templates/1 or /voucher_templates/1.json
  def destroy
    @voucher_template.destroy

    respond_to do |format|
      format.html { redirect_to voucher_templates_url, notice: "Voucher template was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voucher_template
      @voucher_template = VoucherTemplate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def voucher_template_params
      params.require(:voucher_template).permit(:title, :chance)
    end
end
