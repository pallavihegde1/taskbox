class CategoriesController < ApplicationController
   def index 
    @categories = Category.all
   end
   def new
    @client=Client.find(params[:client_id])
    @category= Category.new
   end
   def create 
      @category = Category.new(category_params)
    if @category.save
       respond_to do |format|
       format.js
    end
   end
end

def category_params
	params[:category].permit(:name)
end
def edit
 @client=Client.find(params[:client_id])
  end
def destroy 
@category = Category.find(params[:id])
   @category.destroy
    respond_to do |format|
       format.js
    end
end

end