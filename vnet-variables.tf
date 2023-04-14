variable "vnet_name" {
  description = "the name of the network"
  type        = string
  default     = "vnet-azure-test"

}
variable "vnet_security_group_name" {
  description = "the name of the SG of the network "
  type        = string
  default     = "vnet-sg-test"
}

variable "vnet_address_space" {
  description = "the address cidr of the vnet"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}
# The web subnet defination
variable "web_subnet_name" {
  description = "the name of the web subnet"
  type        = string
  default     = "vnet-web-subnet"
}

variable "web_subnet_address" {
  description = "the address cidr of the websubnet"
  type        = list(string)
  default     = ["10.0.10.0/24"]
}

# The App subnet defination 

variable "app_subnet_name" {
  description = "the name of the web subnet"
  type        = string
  default     = "vnet-app-subnet"
}

variable "app_subnet_address" {
  description = "the address cidr of the websubnet"
  type        = list(string)
  default     = ["10.0.50.0/24"]
}

# The DB subnet 

variable "db_subnet_name" {
  description = "the name of the web subnet"
  type        = string
  default     = "vnet-db-subnet"
}

variable "db_subnet_address" {
  description = "the address cidr of the websubnet"
  type        = list(string)
  default     = ["10.0.70.0/24"]
}

#the Bastion host subnet 

variable "bastion_subnet_name" {
  description = "the name of the web subnet"
  type        = string
  default     = "vnet-bastion-subnet"
}

variable "bastion_subnet_address" {
  description = "the address cidr of the websubnet"
  type        = list(string)
  default     = ["10.0.80.0/24"]
}

variable "NSG-web" {
  description = "the name of the NSG web"
  type        = string
  default     = "nsg-web"
}

variable "NSG-app" {
  description = "the name of the NSG web"
  type        = string
  default     = "nsg-app"
}
variable "NSG-db" {
  description = "the name of the NSG web"
  type        = string
  default     = "nsg-db"
}
variable "NSG-bastion" {
  description = "the name of the NSG web"
  type        = string
  default     = "nsg-bastion"
}