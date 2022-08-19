class PeopleController < ApplicationController
  def index
    # @products = Product.order(id: :desc)
  end

  def new
    @person = Person.new 
  end

  def create
    binding.pry
    @person = Person.new(person_params)
    if @person.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            # turbo_stream.update("flash", partial: "shared/flash", locals: { notice: "Person record created" }),
            # turbo_stream.update("user-about", partial: "users/about", locals: { user: current_user })
          ]
        end
        format.html do
          redirect_to people_path, notice: "Person record created"
        end
      end
    else
      render :form_update, status: :unprocessable_entity
    end
  end

  # def edit
  #   @product = Product.find(params[:id])
  # end

  # def update
  #   @product = Product.find(params[:id])

  #   if @product.update(product_params)
  #     redirect_to products_path
  #   else
  #     render :form_update, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   Product.destroy(params[:id])
  #   redirect_to products_path
  # end

  private

  def person_params
    params.require(:person).permit(:firstname, :lastname, :email, :nickname, :phone)
  end
end
