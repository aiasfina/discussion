div.row
  div.col-sm-11
    h2 Postss
  div.col-sm-1
    a.btn.btn-success.btn-xs href="/postss/new" New
div.table-responsive
  table.table.table-striped
    thead
      tr
        th Title
        th Body
        th Actions
    tbody
    - postss.each do |posts|
      tr
        td = posts.title
        td = posts.body
        td
          span
            a.btn.btn-primary.btn-xs href="/postss/#{ posts.id }" read
            a.btn.btn-success.btn-xs href="/postss/#{ posts.id }/edit" edit
            a.btn.btn-danger.btn-xs href="/postss/#{ posts.id }?_method=delete" onclick="return confirm('Are you sure?');" delete

