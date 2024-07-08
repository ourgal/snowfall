{ lib, ... }: with lib; { capitalize = str: toUpper (substring 0 1 str) + substring 1 (-1) str; }
