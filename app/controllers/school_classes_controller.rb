class SchoolClassesController < ApplicationController

    def show
        @school = SchoolClass.find(params[:id])
    end

    def new
        @school = SchoolClass.new
    end
    
    def create
        @school = SchoolClass.new(post_params(:title, :room_number))
        @school.save
        redirect_to school_class_path(@school)
    end

    def update
        @school = SchoolClass.find(params[:id])
        @school.update(post_params(:title, :room_number))
        redirect_to school_class_path(@school)
    end
    
    def edit
        @school = SchoolClass.find(params[:id])
    end

    private

    def post_params(*args)
		params.require(:school_class).permit(*args)
	end
    
end