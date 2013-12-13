class Monitor extends Spine.Controller
	className: "monitor"
	# events:
	# 	"click .detail": "detail"
	constructor: ->
		super
		$(".main").append @render()
	render: ->
		@html require("views/monitor")(type: @type)

module.exports = Monitor