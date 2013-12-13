class Form extends Spine.Controller
	events:
		"submit .form_bg": "submit"
	submit: (e) ->
		e.preventDefault()
		$form = $(e.currentTarget)
		request_url = Spine.Model.host + $form.data().action
		console.log $form.serialize()

		# $.post request_url,$form.serialize(),(d) ->
		# 	if d.status is 0
		# 		$form[0].reset()
		# 		$form.find("input.submit").addClass "success"
		Spine.Route.navigate($form.data().back, true)
module.exports = Form