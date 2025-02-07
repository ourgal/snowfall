{ ... }: _final: prev: { jackett = prev.jackett.overrideAttrs { doCheck = false; }; }
