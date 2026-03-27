class TodosController < ApplicationController
  before_action :set_todo_infos, only: %i[ show edit update destroy ]

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
  end

  def update
    if @todo.update(todo_params)
      redirect_to @todo
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @todo.destroy
    redirect_to categories_path
  end

  private
    def set_todo_infos
      @todo = Todo.find(params.expect(:id))
      @categories = Category.all
    end

    def todo_params
      params.expect(todo: [ :title, :description, :category_id ])
    end
end
