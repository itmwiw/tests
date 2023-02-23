variable "auth" {

  type = object({
    address = string
    mount = string
    #token_filepath = string
    role = string
    jwt_filepath = string
  })
}

variable "skip_tls_verify"{
  type = bool
  default = false 
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}      

variable "subscription_id" {
  type = string
}      

variable "tenant_id" {
  type = string
} 

variable "backend" {
  type = string
}

