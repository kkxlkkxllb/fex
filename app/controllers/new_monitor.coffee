class NewMonitor extends Spine.Controller
	className: "new_monitor"
	# events:
	# 	"click .detail": "detail"
	constructor: ->
		super
		$(".main").append @render()
		@setupDatetime()
	render: ->
		@html require("views/new_monitor")()
	setupDatetime: ->
		datetime_options =
			format: 'yyyy-mm-dd'
			language: "zh-CN"
			minView: 'month'
			autoclose: true
			startDate: $.date().adjust("D", +1).date()
			endDate: $.date().adjust("D", +30).date()
		$(".date_select").datetimepicker datetime_options
module.exports = NewMonitor