class ItemsController < ApplicationController
  #アクションが呼ばれる前に呼び出すべき命令の記述（before_action等）
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end

end
