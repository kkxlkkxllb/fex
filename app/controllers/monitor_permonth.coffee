Panel = require("controllers/panel")
class MonitorPermonth extends Panel
	className: "monitor_permonth"
	constructor: ->
		super
	render: ->
		@html require("views/monitor_permonth")(type: @type)

module.exports = MonitorPermonth