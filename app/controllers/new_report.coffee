Form = require("controllers/form")
class NewReport extends Form
	className: "new_report"
	events:
		"click .remove_upload": "remove_file"
		"submit .form_bg": "submit"
	constructor: ->
		super
		$(".main").append @render()
		$('#fileupload').fileupload
			dataType: "json"
			progressall: (e, data) ->
				$("#progress").addClass "active"
				progress = parseInt(data.loaded / data.total * 100, 10)
				$("#progress .progress-bar").css
					"width": progress + '%'
			done: (e,data) ->
				$("#progress").removeClass "active"
				$.each data.result.data, (index,file) ->
					$(".upload_list_main table").append require("views/new_report/upload_item")(name: file)
	render: ->
		@html require("views/new_report")(type: @type)
	remove_file: (e) ->
		$(e.currentTarget).parent("tr").remove()
module.exports = NewReport