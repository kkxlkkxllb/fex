Form = require("controllers/form")
class NewMonitor extends Form
	className: "new_monitor"
	events:
		"click .addOne": "addOne"
		"click .delete": "deleteOne"
		"submit .form_bg": "submit"
	constructor: ->
		super
		$(".main").append @render()
		@setupDatetime()
		@addOne()
	render: ->
		@html require("views/new_monitor")(type: @type)
	addOne: (e) ->
		e.preventDefault() if e
		$("tr.action").before require("views/new_monitor/rise_item")()
	deleteOne: (e) ->
		$(e.currentTarget).parents("tr").remove()
	setupDatetime: ->
		datetime_options =
			format: 'yyyy-mm'
			language: "zh-CN"
			startView: 'year'
			minView: 'year'
			autoclose: true
		$(".date_select").datetimepicker datetime_options
module.exports = NewMonitor