class Home extends Spine.Controller
	className: "home"
	constructor: ->
		super
		$(".main").append @render()
	render: ->
		@html require("views/home")()
module.exports = Home