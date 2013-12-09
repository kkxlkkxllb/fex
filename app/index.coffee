require('lib/setup')
Spine = require('spine')
Chart = require("controllers/chart")
Home = require("controllers/home")
Report = require("controllers/report")
ReportDetail = require("controllers/report_detail")
NewReport = require("controllers/new_report")
NewMonitor = require("controllers/new_monitor")
Monitor = require("controllers/monitor")
MonitorDetail = require("controllers/monitor_detail")

class App extends Spine.Controller
	el: "body"
	events:
		# "mouseenter .left_nav a": "toggleImg"
		# "mouseleave .left_nav a": "toggleImg"
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
			"": ->
				Spine.Route.navigate("/", true)
			"/": ->
				@release "#"
				@view = new Home()
			"report_e": ->
				@release "#report_e"
				@view = new Report()
			"monitor_e": ->
				@release "#monitor_e"
				@view = new Monitor()
			"report/:id/detail": (e) ->
				@release "#report_e"
				@view = new ReportDetail()
			"monitor/:id/detail": (e) ->
				@release "#monitor_e"
				@view = new MonitorDetail()
			"report_e/new": ->
				@release "#report_e"
				@view = new NewReport()
			"monitor_e/new": ->
				@release "#monitor_e"
				@view = new NewMonitor()
			"report_p": ->
				@release "#report_p"
				@view = new Report()
			"monitor_p": ->
				@release "#monitor_p"
				@view = new Monitor()
	# toggleImg: (e) ->
	# 	$img = $(e.currentTarget).find("img")
	# 	origin_src = $img.attr("src")
	# 	[begin,end] = origin_src.split("_")
	# 	last = begin.charAt(begin.length - 1)
	# 	if last is '2'
	# 		begin = begin.substring(0, begin.length - 1)
	# 	else
	# 		begin = begin + "2"
	# 	$img.attr("src",begin+ "_" + end)

	toggleButton: (e) ->
		$(e.currentTarget).toggleClass("bg_button_mouse_move")

	toggleNavBgDown: (e) ->
		$(e.currentTarget).toggleClass("right_nav_down_bg")

$ ->
	new App()
	Spine.Route.setup()
