# Région où sera déployée la ressource
variable "location" {
  description = "La région dans laquelle les ressources seront créées."
  type        = string
  default     = "Korea Central"  # Remplacez par votre région préférée
}

# Nom du groupe de ressources
variable "resource_group_name" {
  description = "Le nom du groupe de ressources à créer."
  type        = string
  default     = "UBUNTU-SERVER_GROUP"
}

# Nom du réseau virtuel
variable "virtual_network_name" {
  description = "Le nom du réseau virtuel."
  type        = string
  default     = "myVNet"
}

# Plage d'adresses du réseau virtuel
variable "address_space" {
  description = "L'espace d'adresses pour le réseau virtuel."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

# Nom du sous-réseau
variable "subnet_name" {
  description = "Le nom du sous-réseau à créer."
  type        = string
  default     = "default"
}

# Plage d'adresses du sous-réseau
variable "subnet_address_prefixes" {
  description = "Les préfixes d'adresses pour le sous-réseau."
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

# Nom de l'adresse IP publique
variable "public_ip_name" {
  description = "Le nom de l'adresse IP publique à créer."
  type        = string
  default     = "myPublicIP"
}

# Nom de l'interface réseau
variable "network_interface_name" {
  description = "Le nom de l'interface réseau à créer."
  type        = string
  default     = "myNIC"
}

variable "subscription_id" {
  description = "ID de l'abonnement Azure"
  type        = string
}

variable "client_id" {
  description = "ID du client Azure"
  type        = string
}

variable "client_secret" {
  description = "Secret du client Azure"
  type        = string
}

variable "tenant_id" {
  description = "ID de l'annuaire Azure (tenant)"
  type        = string
}
