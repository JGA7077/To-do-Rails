class TodosController < ApplicationController
  before_action :set_todo, only: %i[show]

  def show
  end

  private
    def set_todo
      @todo = Todo.find(params.expect(:id))
    end
end
