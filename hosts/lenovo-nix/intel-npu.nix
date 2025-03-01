{ lib, pkgs, config, ... }:

{
  # Intel NPU driver
  hardware.firmware = lib.optionals (config.hardware.enableRedistributableFirmware) [
    (
      let
        model = "37xx";
        version = "0.0";

        firmware = pkgs.fetchurl {
          url = "https://github.com/intel/linux-npu-driver/raw/v1.13.0/firmware/bin/vpu_${model}_v${version}.bin";
          hash = "sha256-Mpoeq8HrwChjtHALsss/7QsFtDYAoFNsnhllU0xp3os=";
        };
      in
      pkgs.runCommand "intel-vpu-firmware-${model}-${version}" { } ''
        mkdir -p "$out/lib/firmware/intel/vpu"
        cp '${firmware}' "$out/lib/firmware/intel/vpu/vpu_${model}_v${version}.bin"
      ''
    )
  ];
  warnings = lib.mkIf (!config.hardware.enableRedistributableFirmware) [
    ''For Intel NPU support, set the option: hardware.enableRedistributableFirmware = true;''
  ];
}
