locals {
  resource_group = "rg-taskmanager"
  location       = "uksouth"
  app_name       = "taskmanageracr"
  env_name       = "tm-env"
  container_name = "tm-app"
  image_tag      = "latest"
}
