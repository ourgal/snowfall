{
  servs.redshift.provider = "geoclue2";
  value.systemd.user.services.redshift.Unit.ConditionEnvironment = "XAUTHORITY";
}
