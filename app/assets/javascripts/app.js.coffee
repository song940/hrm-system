#= require nprogress


window.App =

  log: (msg)->
    console.log(msg)

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
    NProgress.done(true)


# NProgress
NProgress.configure
  speed: 300

$(document).on 'click','.btn-upload',(ev)->
  wrapper =  $(ev.target).parent()
  fileInput = wrapper.find('input[type=file]')
  fileInput.on 'change',->
    wrapper.find('input[type=text]').val(this.value)
  
  fileInput.click()


$(document).on 'page:fetch', ->
  NProgress.start()
$(document).on 'page:restore', ->
  NProgress.remove()
$(document).on 'page:change', ->
  App.init()
  


$(document).ready -> 
  App.init()
