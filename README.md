# ECS-Azure

---

## To Do List:

### Step 6: CI/CD Pipeline
- [ ] Set up GitHub Actions workflow to build and push Docker image to ACR on every push to main.
- [ ] Configure pipeline to automatically update the Container App with the new image.
- [ ] Store Azure credentials securely as GitHub Actions secrets.
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

### Step 4: Front Door - Custom Domain & HTTPS
- [X] Verified tm.kbakar.site is fully validated in Front Door.
- [X] Confirmed end-to-end HTTPS is working correctly.

### Step 5: Terraform Restructure & Dependency Fix
- [X] Resolved circular dependency between `az_container_app` and `role_assignment` modules.
- [X] Moved `azurerm_user_assigned_identity` into `role_assignment` module so identity and AcrPull role are created before the container app.
- [X] Passed `identity_id` output from `role_assignment` into `az_container_app`, establishing correct one-directional dependency chain.
- [X] Removed `role_assignment_dependency` feedback loop that was causing the Terraform cycle error.
- [X] Added `network` module (VNet + subnet) as foundation for future Private Link integration.
- [X] Fixed Front Door origin to use correct container app FQDN.
- [X] Verified AcrPull role assignment, VNet, and subnet provisioning via Azure CLI.