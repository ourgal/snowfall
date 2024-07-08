set +e
systemctl --user restart sops-nix.service
if test $? -ne 0; then
  rm -rf /run/user/1000/secrets.d/*
fi
