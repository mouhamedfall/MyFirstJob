// Newedge

// Repo: ssh://gitolite@forge.b-com.com/new-edge/wef/vnf-hss.git

// getServiceStandardParameters adds the following parameters with default values:
// IMAGE_NAME
// ARTIFACTORY_CREDENTIAL_ID
// DOCKER_REGISTRY
// GIT_CREDENTIAL_ID
getServiceStandardParameters()

// Checkout source from git and stash it to 'source'
checkoutGit()

// Build and Push Docker Image
buildDocker NAME: params.IMAGE_NAME,
  PUSH: 'master'.equals(env.BRANCH_NAME),
  REGISTRY: params.DOCKER_REGISTRY,
  CREDENTIALS: params.ARTIFACTORY_CREDENTIAL_ID

// try to Promote Release
gitPromoteRelease gitCredentialId: params.GIT_CREDENTIAL_ID