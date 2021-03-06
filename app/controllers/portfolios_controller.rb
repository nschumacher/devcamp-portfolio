class PortfoliosController < ApplicationController
    layout "portfolio"

    def index
        @portfolio_items = Portfolio.all # could do .where(subtitle: "Ruby on Rails") to pull back only ones with that subtitle
    end

    def new
        @portfolio_item = Portfolio.new
        3.times { @portfolio_item.technologies.build } # .build is like saying "instantiate this object", so this will instantiate 3 technologies for the portfolio item
    end

    def create
        @portfolio_item = Portfolio.new(portfolio_params)

        respond_to do |format|
            if @portfolio_item.save
                format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
            else
                format.html { render :new }
            end
        end
    end

    def edit
        @portfolio_item = Portfolio.find(params[:id]) #looks in the params of the uri for the id param

    end

    def update
        @portfolio_item = Portfolio.find(params[:id]) #looks in the params of the uri for the id param

        respond_to do |format|
            if @portfolio_item.update(portfolio_params)
                format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
            else
                format.html { render :edit }
            end
        end
    end

    def show
        @portfolio_item = Portfolio.find(params[:id]) #looks in the params of the uri for the id param
    end

    def destroy
        @portfolio_item = Portfolio.find(params[:id]) #looks in the params of the uri for the id param
        
        @portfolio_item.destroy
        respond_to do |format|
          format.html { redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.' }
        end
    end

    private 
    def portfolio_params
        params.require(:portfolio).permit(:title, 
                                        :subtitle,
                                        :body,
                                        technologies_attributes: [:name]
                                    )
    end
end
