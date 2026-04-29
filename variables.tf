variable "extra_labels" {
  type        = map(string)
  default     = {}
  description = <<EOF
Additional labels to apply to the Kubernetes namespace.
These are merged with the labels that Nullstone applies by default.
EOF
}
