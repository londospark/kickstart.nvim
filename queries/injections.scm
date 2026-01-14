; Inject HTML into the view! macro
(macro_invocation
  (scoped_identifier
    path: (identifier) @path
    name: (identifier) @name)
  (token_tree) @injection.content
  (#eq? @name "view")
  (#set! injection.language "html"))

; Inject HTML into the plain view! macro (if imported directly)
(macro_invocation
  (identifier) @name
  (token_tree) @injection.content
  (#eq? @name "view")
  (#set! injection.language "html"))

