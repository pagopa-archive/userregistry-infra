prefix = "usrreg"

# ingress
nginx_helm_version       = "4.0.12"
ingress_replica_count    = "2"
ingress_load_balancer_public_ip = "20.105.56.232"
ingress_load_balancer_private_ip_custom = "10.1.0.250"

# RBAC
rbac_namespaces_for_deployer_binding = ["usrreg"]

# Gateway
api_gateway_url = "https://api.uat.userregistry.pagopa.it"

# configs/secrets
