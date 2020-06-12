variable "name_iam_role" {
  default     = ""
  description = "the Name of the role"
}
variable "name_iam_policy" {
  default     = ""
  description = "the Name of the iam policy"
}
variable "name_prefix" {
  default     = ""
  description = "Creates a unique name beginning with the specified prefix"
}
variable "enabled" {
  type = string
  default = "true"
}
variable "force_detach_policies" {
  type    = bool
  default = false
}
variable "max_session_duration" {
  default     = 3600
  description = "The maximum session duration (in seconds) that you want to set for the specified role, by default is one hour"
}
variable "tags" {
  description = "tags for IAM role"
  type        = map(string)
  default     = {}
}
variable "policy_description" {
  type = string
  description = "policy description"
  default = ""
}

variable "defined_policies" {
  type = list(string)
  description = "predifined arn policies to attatch"
  default=[]
}

variable "principals" {
  type        = map
  description = "Map of service name as key and a list of ARNs to allow assuming the role as value"
  default     = {}
}


variable "policies" {
  type    = list(string)
  default = []
}