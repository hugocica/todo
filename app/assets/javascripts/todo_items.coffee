# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	$('#listing_items').sortable
		axis: 'y'
		update: ->
			position = 1
			list_path = $(this).data('update-position')
			$(this).children().each ->
				id = $(this).attr('id')
				$.ajax
					url: list_path+'/todo_items/'+id+'/sort'
					type: 'POST'
					dataType: "json"
					data: "position="+position
				position++

	$('#todo_item_content').attr('autocomplete', 'off')