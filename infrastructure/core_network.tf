
resource "hyperv_network_switch" "tko_tf_net_switch_default" {
  name                                    = "tko_tf_internal"
  notes                                   = ""
  allow_management_os                     = true
  enable_embedded_teaming                 = false
  enable_iov                              = false
  enable_packet_direct                    = false
  minimum_bandwidth_mode                  = "None"
  #switch_type                             = "Internal"
  switch_type                             = "External"
  net_adapter_names                       = ["Wi-Fi"]
  #net_adapter_names                       = ["I_Never_Knew_Him_Not_To_Be...", "Intel(R) Centrino(R) Advanced-N 6235"]
  #net_adapter_names                       = ["Intel(R) Centrino(R) Advanced-N 6235"]
  default_flow_minimum_bandwidth_absolute = 0
  default_flow_minimum_bandwidth_weight   = 0
  default_queue_vmmq_enabled              = false
  default_queue_vmmq_queue_pairs          = 16
  default_queue_vrss_enabled              = false
}
