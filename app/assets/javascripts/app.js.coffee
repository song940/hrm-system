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
#= require jquery_nested_form
#= require bootstrap
#= require nprogress
#=* require_tree .
#


window.App =

  log: (msg)->
    console.log(msg)

  locale: ()->
    document.cookie = "locale=" + navigator.language + ';'

  fackie: ()->
    $('.fuck-ie').remove() unless /MSIE/.test(navigator.userAgent)

  init:() -> 
     # Go Top
    $("a.go_top").click  ->
      $('html, body').animate({ scrollTop: 0 },300)
      return false

    # Go top
    $(window).bind 'scroll resize', ->
      scroll_from_top = $(window).scrollTop()
      if scroll_from_top >= 1
        $("a.go_top").show()
      else
        $("a.go_top").hide()

    #NProgress
    NProgress.configure
      speed: 300
      
    NProgress.done(true)

    App.fackie()
    App.locale()
    #
    #$('#check_month button')[new Date().getMonth()].click()



$(document).on 'click','.btn-upload',(ev)->
  wrapper =  $(ev.target).parent()
  fileInput = wrapper.find('input[type=file]')
  fileInput.on 'change',->
    wrapper.find('input[type=text]').val(this.value)
  
  fileInput.click()

$(document).on 'click','.btn-search-check',(ev) ->
  #ev.preventDefault()
  month = $('#check_month button.active').text()
  type = $('#check_type  button.active').text()
  employee = $("#check_employee").val()
  $('input[name=month]').val(month)
  #$('input[name=type]').val(type)
  #
  



$(document).on 'click','.btn-exception',(ev) ->
  $tr = $(ev.target).closest('tr')
  data = $tr.data()
  data['type'] = $tr.find('select').val()
  console.log data
  $(ev.target).button('loading')
  $.post '/checks/exception',data ,()->
    $(ev.target).button('reset')
    $tr.hide('slow')



$(document).on 'page:fetch', ->
  NProgress.start()
$(document).on 'page:restore', ->
  NProgress.remove()
$(document).on 'page:change', ->
  App.init()
  


$(document).ready -> 
  App.init()
