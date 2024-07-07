
resource "hyperv_vhd" "tko_tf_server1_vhd" {
  path = "D:\\VirtualMachines\\Hyper-V\\Virtual Hard Disks\\tko_tf_server1.vhdx"
  #source               = ""
  #source_vm            = ""
  #source_disk          = 0
  vhd_type = "Dynamic"
  #parent_path          = ""
  size = 10737418240 #10GB
  #block_size           = 0
  #logical_sector_size  = 0
  #physical_sector_size = 0
}
