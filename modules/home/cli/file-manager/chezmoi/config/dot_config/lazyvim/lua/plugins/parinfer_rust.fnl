(let [help (require :help)
      repo :parinfer-rust
      enabled (help.enabled repo :lang :lisp)]
  {1 (help.name :eraserhd repo) : enabled :ft :lisp})
