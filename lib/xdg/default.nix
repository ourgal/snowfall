{ lib, ... }:
with lib;
{
  defaultTypes =
    default: types:
    listToAttrs (
      foldl' (
        acc: type:
        acc
        ++ [
          {
            name = type;
            value = default;
          }
        ]
      ) [ ] types
    );
}
