doctype html
html
  head
    title Discussion using Amber
    meta charset="utf-8"
    meta http-equiv="X-UA-Compatible" content="IE=edge"
    meta name="viewport" content="width=device-width, initial-scale=1"

  body
    div.masthead
      div.container
        nav.nav
          == render_template "layouts/_nav.slang"
    div.container
      div.row
      - flash.each do |key, value|
        div class="alert alert-#{ key }"
          p = flash[key]
      div.row
        div.col-sm-12.main
          == content

    script src="/assets/app.js"


