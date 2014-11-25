Template.landing.events {
  "click a.logo": (e, t) ->
    html2canvas $(".branding")[0], {
      onrendered: (canvas) -> 
        src = canvas.toDataURL('image/png')
        url = src.replace(/^data:image\/[^;]/, 'data:application/octet-stream')
        window.location = url

    }
}