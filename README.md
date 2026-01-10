# ECS-Azure

---

## To Do List:

### Step 4: Restructuring
- [X] Restructuring Terraform architect
- [X] Remove hardcoded values
> Note: Updates for these steps will be added soon.

---

## Completed:

### Step 1: Containerisation
- [X] Packaged the application (tm-app) into a Docker container.
- [X] Validated that the application works locally inside the container.

### Step 2: Container Registry
- [X] Set up an Azure Container Registry (cntaskmanager).
- [X] Tagged the Docker image for ACR.
- [X] Pushed the container image to the registry.
- [X] Confirmed the image exists in ACR and can be pulled.

### Step 3: Container App Deployment
- [X] Created the Container App Environment.
- [X] Deployed the Container App using the image from ACR.
- [X] Configured system-assigned managed identity for the Container App.
- [X] Enabled ACR authentication using managed identity (AcrPull).