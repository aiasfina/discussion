p = posts.title
p = posts.body
p
  a.btn.btn-default.btn-xs href="/postss" back
  a.btn.btn-success.btn-xs href="/postss/#{ posts.id }/edit" edit
  a.btn.btn-danger.btn-xs href="/postss/#{ posts.id }?_method=delete" onclick="return confirm('Are you sure?');" delete
