class DashboardController < ApplicationController

	def index
    @projects = Project.order(updated_at: :desc)
  end
end
