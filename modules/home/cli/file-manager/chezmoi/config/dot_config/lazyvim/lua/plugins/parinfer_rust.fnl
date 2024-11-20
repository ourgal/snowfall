(let [help (require :help)
      repo :parinfer-rust
      enabled (help.enabled repo :edit)]
  {1 (help.name :eraserhd repo) : enabled :ft :lisp})
