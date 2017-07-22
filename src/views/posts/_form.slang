- if posts.errors
  ul.errors
  - posts.errors.each do |error|
    li = error

- action = (posts.id ? "/postss/" + posts.id.to_s : "/postss")
form action="#{ action }" method="post"
  - if posts.id
    input type="hidden" name="_method" value="patch"
  div.form-group
    input.form-control type="text" name="title" placeholder="Title" value="#{ posts.title }"
  div.form-group
    textarea.form-control rows="10" name="body" placeholder="Body" =  posts.body
  button.btn.btn-primary.btn-xs type="submit" Submit
  a.btn.btn-default.btn-xs href="/postss" back
