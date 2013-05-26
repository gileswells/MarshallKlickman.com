class ProjectsController < SiteController
  
  def index
    @player = Dribbble::Player.find('mklickman');
  end

  def show
  end
end
