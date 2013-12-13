require('lib/setup')
Spine = require('spine')
Spine.Model.host = "/"
Chart = require("controllers/chart")
Home = require("controllers/home")
Report = require("controllers/report")
ReportDetail = require("controllers/report_detail")
NewReport = require("controllers/new_report")
NewMonitor = require("controllers/new_monitor")
Monitor = require("controllers/monitor")
MonitorDetail = require("controllers/monitor_detail")
MonitorPermonth = require("controllers/monitor_permonth")

class App extends Spine.Controller
	el: "body"
	events:
		"mouseenter .bg_button": "toggleButton"
		"mouseleave .bg_button": "toggleButton"
		"mouseenter .right_nav_bg": "toggleNavBgDown"
		"mouseleave .right_nav_bg": "toggleNavBgDown"

	release: (cls) ->
		$(".left_nav ul li a").removeClass "active"
		$target = $("a[href='#{cls}']").addClass "active"
		$target.parent("li").addClass("current").siblings().removeClass "current"
		@view.release() if @view
	constructor: ->
		super
		@routes
			"chart": ->
				new Chart(el: $("body"))
			"": ->
				Spine.Route.navigate("/", true)
			"/": ->
				@release "#"
				@view = new Home()
			"report/:type": (params) ->
				@release("#report/" + params.type)
				@view = new Report(type: params.type)
			"report/:type/:id/detail": (params) ->
				@release("#report/" + params.type)
				@view = new ReportDetail(type: params.type)
			"report/:type/new": (params) ->
				@release("#report/" + params.type)
				@view = new NewReport(type: params.type)
			"monitor/:type": (params) ->
				@release("#monitor/" + params.type)
				@view = new Monitor(type: params.type)
			"monitor/:type/:id/detail": (params) ->
				@release("#monitor/" + params.type)
				@view = new MonitorDetail(type: params.type)
			"monitor/:type/:id/month/:month": (params) ->
				@release("#monitor/" + params.type)
				obj =
					type: params.type
				@view = new MonitorPermonth(obj)
			"monitor/:type/new": (params) ->
				@release("#monitor/" + params.type)
				@view = new NewMonitor(type: params.type)

	toggleButton: (e) ->
		$(e.currentTarget).toggleClass("bg_button_mouse_move")

	toggleNavBgDown: (e) ->
		$(e.currentTarget).toggleClass("right_nav_down_bg")

$ ->
	new App()
	Spine.Route.setup()
