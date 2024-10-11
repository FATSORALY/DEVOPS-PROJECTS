# Spécifier le fournisseur Azure
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id      = var.client_id
  client_secret  = var.client_secret
  tenant_id      = var.tenant_id
}

# Créer un groupe de ressources
resource "azurerm_resource_group" "UBUNTU-SERVER_GROUP" {
  name     = "UBUNTU-SERVER_GROUP"
  location = "Korea Central"  # Remplacez par votre région préférée
}

# Créer un réseau virtuel
resource "azurerm_virtual_network" "myVNet" {
  name                = "myVNet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.UBUNTU-SERVER_GROUP.location
  resource_group_name = azurerm_resource_group.UBUNTU-SERVER_GROUP.name
}

# Créer un sous-réseau
resource "azurerm_subnet" "default" {
  name                 = "default"
  resource_group_name  = azurerm_resource_group.UBUNTU-SERVER_GROUP.name
  virtual_network_name = azurerm_virtual_network.myVNet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Créer une adresse IP publique
resource "azurerm_public_ip" "myPublicIP" {  # Changement de nom ici
  name                = "myPublicIP"
  location            = azurerm_resource_group.UBUNTU-SERVER_GROUP.location
  resource_group_name = azurerm_resource_group.UBUNTU-SERVER_GROUP.name
  allocation_method   = "Static"
}

# Créer une interface réseau
resource "azurerm_network_interface" "myNIC" {
  name                = "myNIC"
  location            = azurerm_resource_group.UBUNTU-SERVER_GROUP.location
  resource_group_name = azurerm_resource_group.UBUNTU-SERVER_GROUP.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.default.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.myPublicIP.id  # Référence mise à jour ici
  }
}
