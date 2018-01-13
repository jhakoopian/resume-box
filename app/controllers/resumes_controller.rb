class ResumesController < ApplicationController
  before_action :set_resume, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @resumes = current_user.resumes
  end

  def show
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = current_user.resumes.new(resume_params)

    if @resume.save
      flash[:notice] = "Your resume was successfully uoloaded."
      redirect_to resumes_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @resume.assign_attributes(resume_params)

    if @resume.update_attributes(resume_params)
      flash[:notice] = "Your resume was successfully updated."
      redirect_to resume_path
    else
      render :edit
    end
  end

  def destroy
    if @resume.destroy
      flash[:notice] = "Your resume was deleted successfully."
      redirect_to resumes_path
    else
      render :show
    end
  end

  private
  def resume_params
    params.require(:resume).permit(:name, :document)
  end

  def set_resume
    @resume = Resume.find(params[:id])
  end

  def record_not_found
    redirect_to resumes_path
  end
end
