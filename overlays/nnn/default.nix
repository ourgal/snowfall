{ channels, ... }: final: prev: { nnn = prev.nnn.override { withNerdIcons = true; }; }
