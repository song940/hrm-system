# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require bootstrap
#= require calendar

window.App =
	init: () ->
		$('.nav-tabs').tab()
		$('.btn-edit').click (ev) ->
			ev.preventDefault()
			console.log this

	check: ()->
		$(document).on "click","td.normal", (ev) -> 
			$that = $(ev.target)
			day = $that.data('day')
			date = $that.closest('table').data('date') + "-" + day
			mark = !$that.hasClass('active')
			$.get('/admin/checks/mark',{ flag: mark,date: date },()->
				$that.removeClass('active') unless mark
				$that.addClass('active') if mark
			)
		$('#month .btn').click (ev)->
			month = this.innerText
			$.get('/admin/checks/list',{ month: month, year:new Date().getFullYear() },(data)->
				console.log data
				$("#calendar").calendar({month: month, active: data })
			)
		#
		$('#month .btn')[new Date().getMonth()].click()



$(document).ready ->
	App.init()
	App.check()
