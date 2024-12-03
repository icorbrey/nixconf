{ inputs, ... }:
[
  (final: prev: {
    dmux = inputs.dmux.packages.${prev.system}.default;
  })
]
