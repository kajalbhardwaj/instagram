class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  def index
      @companys = Company.all  
     end
     def show
     end

      def new
        @company = Company.new

      end

      def create
        @company = Company.new(company_params)
        if @company.save
          redirect_to companies_path, notice:  "post was succesfully  destroyed"
        end
      end

      def edit
      end
       
      def update
        
        if @company.update(company_params)
          redirect_to @company
        end
      end

      def destroy
        @company.destroy
        redirect_to companies_path, notice: "post was succesfully  destroyed"
      end
     private

     def company_params
      
      params.require(:company).permit(:first_name, :last_name, :security, :email, :no_of_employees, :gender, :salary, :city)
    end

    def set_company
      @company = Company.find(params[:id])
     # @company = Company.find_by(id: [params[:id], params[:company]])
    end

 end
