class Panel extends Spine.Controller
	events:
		"click .right_main_list": "togglePanel"
	constructor: ->
		super
		$(".main").append @render()
		if @type is "e"
			@initChart()
	togglePanel: (e) ->
		$target = $(e.currentTarget)
		$panel = $target.next()
		if $panel.hasClass "hide"
			$panel.removeClass "hide"
			$target.find(".list_title_button").text "-收缩"
		else
			$panel.addClass "hide"
			$target.find(".list_title_button").text "+展开"
	initChart: ->
		$("#chart_1").highcharts
			credits:
				enabled: false
			chart:
				type: 'column'
			title:
				text: '交易金额'
			exporting:
				enabled: false
			tooltip:
				enabled: false
			xAxis:
				categories: [
					'Jan'
					'Feb'
					'Mar'
					'Apr'
					'May'
					'Jun'
					'Jul'
					'Aug'
					'Sep'
					'Oct'
					'Nov'
					'Dec'
				]
			yAxis:
				min: 0
				gridLineDashStyle: 'longdash'
				title:
					text: ''
			plotOptions:
				column:
					pointPadding: -0.3
					groupPadding: 0.2
					borderWidth: 0

			series: [
				name: 'Tokyo'
				data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
			,
				name: 'New York'
				data: [83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3]
			]
		$("#chart_2").highcharts
			credits:
				enabled: false
			chart:
				type: 'column'
			exporting:
				enabled: false
			title:
				text: '交易笔数'
			tooltip:
				enabled: false
			xAxis:
				categories: [
					'Jan'
					'Feb'
					'Mar'
					'Apr'
					'May'
					'Jun'
					'Jul'
					'Aug'
					'Sep'
					'Oct'
					'Nov'
					'Dec'
				]
			yAxis:
				min: 0
				gridLineDashStyle: 'longdash'
				title:
					text: ''

			series: [
				name: 'Tokyo'
				data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
			]

module.exports = Panel