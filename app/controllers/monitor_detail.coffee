class MonitorDetail extends Spine.Controller
	className: "monitor_detail"
	constructor: ->
		super
		$(".main").append @render()
	render: ->
		@html require("views/monitor_detail")(type: @type)

module.exports = MonitorDetail