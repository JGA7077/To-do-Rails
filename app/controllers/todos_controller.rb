class TodosController < ApplicationController
  before_action :set_todo, only: %i[ show edit ]

  def show
  end

  def new
    @todo = Todo.new
    @categories = Category.all
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to @todo
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @categories = Category.all
  end

  private
    def set_todo
      @todo = Todo.find(params.expect(:id))
    end

    def todo_params
      params.expect(todo: [ :title, :description, :category_id ])
    end
end
