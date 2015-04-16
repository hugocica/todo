# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	$('#listing_items').sortable
		axis: 'y'
		cancel: '.todo_item'
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

	$('.todo_item').blur ->
		content = $(this).text()
		id_master = $('#listing_items').data('update-position')
		id = $(this).parent().attr('id')
		$.ajax
			url: '/todo_lists/'+id_master+"/todo_items/"+id+"/update_content/"
			type: 'post'
			data: 'id='+id+"&content="+content
	
	$('#todo_item_content').attr('autocomplete', 'off')

