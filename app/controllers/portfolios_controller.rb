class PortfoliosController < ApplicationController
	def index
		@portfolio_item = Portfolio.all
	end

	def angular
		@angular_portfolio_items = Portfolio.angular
	end

	def rail
		@rail_portfolio_items = Portfolio.rail
	end

	def new
		@portfolio_item = Portfolio.new
		3.times { @portfolio_item.technologies.build }
	end

	def create
		@portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body,
			technologies_attributes: [:name]))

		respond_to do |format|
			if @portfolio_item.save
				format.html { redirect_to portfolios_path, notice: 'Your portfolio irem is now life.' }
			else
				format.html { render :new }
			end
		end
	end

	def edit
		@portfolio_item = Portfolio.find(params[:id])
	end

	def update
		@portfolio_item = Portfolio.find(params[:id])

		respond_to do |format|
			if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
				format.html { redirect_to portfolios_path, notice: "Your portfoio records have been successfully updated."}
			else
				format.html { render :new }
			end
		end
	end

	def show
		@portfolio_item = Portfolio.find(params[:id])
	end

	def destroy
		# Perform the lookup
		@portfolio_item = Portfolio.find(params[:id])
		# Destroy/delete the record
		@portfolio_item.destroy
		# Redirect
		respond_to do |format|
			format.html {redirect_to portfolios_url, notice: 'Record was removed.'}
		end
	end


end
