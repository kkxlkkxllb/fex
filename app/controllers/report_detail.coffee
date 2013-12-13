Panel = require("controllers/panel")
class ReportDetail extends Panel
	className: "report_detail"
	constructor: ->
		super
	render: ->
		@html require("views/report_detail")(type: @type)

module.exports = ReportDetail