class LaptopsController < ApplicationController


    def new 
        @laptop = Laptop.new 
        @laptop.build_brand
    end 


    def create
        @laptop = Laptop.new(laptop_params)
        @laptop.user_id = session[:user_id]
        if @laptop.save
            redirect_to laptop_path(@laptop)
        else 
            render :new 
        end 
    end 



    private 

    def laptop_params
        params.require(:laptop).permit(:color, :condition, :price, :brand_id, brand_attributes: [:name])
    end 
end
