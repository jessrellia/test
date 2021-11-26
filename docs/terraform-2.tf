locals {
  product_domain                  = "mfc"
  service_name                    = "mfcsis"
  cluster_role                    = "app"
  cluster                         = format("%s-%s", local.service_name, local.cluster_role)
  environment                     = "staging"
  short_environment               = "stg"
  traveloka_additional_config_env = "stg"
  application                     = "java-11"
  app_java_opts                   = "-Dspring.profiles.active=${local.short_environment}"
  app_memory_java_opts            = "-Xmx2g"
  traveloka_maintenance_mode      = "false"
  log_retention_in_days           = 90

  private_domain_name = "${local.product_domain}.stg-tvlk.cloud"

  asg_image_owner_ids               = ["999470832247"] # tvlk-mfc-stg
  asg_health_check_grace_period     = 240
  asg_ami_id                        = data.aws_launch_template.lt.image_id
  asg_min_capacity                  = 1
  asg_max_capacity                  = 2
  codedeploy_deployment_config_name = "CodeDeployDefault.AllAtOnce"
  cwl_prefix                        = "/tvlk/${local.service_role}-${local.lang}/${local.service_name}" # https://29022131.atlassian.net/wiki/x/QAFVBg
  lang                              = "java"
  service_role                      = "app"
  tg_deregistration_delay           = 300
  asg_launch_template_override = [
    {
      instance_type = "t3.small"
    },
    {
      instance_type = "t2.small"
    },
  ]

  terraform_remote_state_bucket               = "default-terraform-state-${data.aws_region.current.name}-${data.aws_caller_identity.current.account_id}"
  terraform_remote_state_shared_resources_key = "ap-southeast-1/deployment/target-environment/terraform.tfstate"

}
