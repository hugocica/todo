class TodoItemsController < ApplicationController
	before_action :set_todo_list
	before_action :set_todo_item, except: [:create]

	def create
		@todo_item = @todo_list.todo_items.create(todo_item_params)
		# redirect_to @todo_list
		
		update_view
	end

	def destroy
		@todo_item.destroy
		
		# redirect_to @todo_list
		respond_to do |format|
			format.js { render layout: false, template: "todo_items/create.js.erb" }
		end
	end

	def complete
		@todo_item.update_attribute(:completed_at, Time.now)
		# redirect_to @todo_list, notice: "Todo item marked"

		update_view
	end

	def uncomplete
		@todo_item.update_attribute(:completed_at, nil)
		# redirect_to @todo_list, notice: "Todo item unmarked"

		update_view
	end

	def sort
		@todo_item.update_attribute(:position, params[:position])
		render :nothing => true
	end

	private

	def update_view
		respond_to do |format|
			format.js { render template: "todo_items/create.js.erb" }
		end
	end

	def set_todo_list
		@todo_list = TodoList.find(params[:todo_list_id])
	end

	def set_todo_item
		@todo_item = @todo_list.todo_items.find(params[:id])
	end

	def todo_item_params
		params[:todo_item].permit(:content, :position)
	end

end