variable "organization" {
  description = "the organization of this use case"
  type        = string
  default     = "test"
}

variable "enviroment" {
  description = "the eviroment that is being launched"
  type        = string
  default     = "dev"


}

variable "resource_group_name" {
  description = "the name of the resource group"
  type        = string
  default     = "test-uat-terraform"
}

variable "resource_group_location" {
  description = "the location of the resource group"
  type        = string
  default     = "eastus"

}