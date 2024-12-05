{ inputs, ... }:
[
  inputs.nur.overlay

  (final: prev: {
    dmux = inputs.dmux.packages.${prev.system}.default;
  })
]
