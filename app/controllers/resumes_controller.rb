class ResumesController < ApplicationController
  before_action :set_resume, only: [:show, :edit, :update, :destroy]

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
      flash.now[:alert] = "There was an error uploading your resume. Please try again."
      render :new
    end
  end

  def edit
  end

  def update
    @resume.assign_attributes(resume_params)

    if @resume.update_attributes(resume_params)
      flash[:notice] = "Your resume was successfully updated."
      redirect_to @resume
    else
      flash.now[:alert] = "There was an error updating your resume. Please try again."
      render :edit
    end
  end

  def destroy
    if @resume.destroy
      flash[:notice] = "\"#{@resume.name}\" was deleted successfully."
      redirect_to resumes_path
    else
      flash.now[:alert] = "There was an error deleting the resume."
      render :show
    end
  end

  private
  def resume_params
    params.require(:resume).permit(:name)
  end

  def set_resume
    @resume = Resume.find(params[:id])
  end
end
