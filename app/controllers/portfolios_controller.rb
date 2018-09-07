class PortfoliosController < ApplicationController
	def index
		@portfolio_item = Portfolio.all
	end
end
