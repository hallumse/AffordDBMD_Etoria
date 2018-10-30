class ResourceController < ApplicationController
  def index
    @resources = Resource.all
  end

  def new
   @resources = Resource.new
   @subjects = Subject.all
  end

  def create
   @resources = Resource.new(resource_params)

   if @resources.save
      redirect_to :action => 'list'
   else
      @subjects = Subject.all
      render :action => 'new'
   end

   def edit
    @resources = Resource.find(params[:title] [:url] [:category])
    @subjects = Subject.all
   end

   def update
   @resources = Resource.find(params[:title] [:url] [:category])

   if @resources.update_attributes(resources_param)
      redirect_to :action => 'show', :link => @resources
   else
      @subjects = Subject.all
      render :action => 'edit'
   end

  def resource_params
    params.require(:resources).permit(:title, :url, :category)
  end
end
