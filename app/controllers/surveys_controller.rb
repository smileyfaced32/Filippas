class SurveysController < ApplicationController

  
  def index
    @surveys = Survey.find(:all)
  end
  
 
  def show
     @survey = Survey.find(params[:id ])
     redirect_to surveys_coupon_path
   end
 
  def new
    @survey = Survey.new
  end
  
  def coupon
      @survey = Survey.find(params[:id])
  end
  
  def export
      headers['Content-Type'] = "application/vnd.ms-excel"
      headers['Content-Disposition'] = 'attachment; filename="customer_survey_report.xls"'
      headers['Cache-Control'] = ''
      @surveys = Survey.find(:all)
  end
  
  def create

    @survey = Survey.new(params[:survey])
    if @survey.save
      flash[:notice] = "Successfully created survey."
      redirect_to "/surveys/#{@survey.id}/coupon"
    else
      flash[:notice] = "Please fill out the customer survey correctly and to its entirety."
      render :action => 'edit'
    end
  end

  def edit
    @survey = Survey.find(params[:id])
  end
  
  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(params[:survey])
      flash[:notice] = "Successfully updated survey."
      redirect_to userprofile_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    flash[:notice] = "Successfully destroyed survey."
    redirect_to userprofile_path
  end
end
