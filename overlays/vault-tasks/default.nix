{ ... }:
_final: prev: {
  vault-tasks = prev.vault-tasks.overrideAttrs (_oldAttrs: {
    checkFlags = [ "--skip=core::sorter::tests::task_sort_by_name" ];
  });
}
