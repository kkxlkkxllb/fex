class Report extends Spine.Controller
	className: "report"
	# events:
	# 	"click .detail": "detail"
	constructor: ->
		super
		$(".main").append @render()
	render: ->
		@html require("views/report")()

module.exports = Report