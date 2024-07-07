terraform {
    required_providers {
        hyperv = {
            source = "taliesins/hyperv"
            version = ">= 1.0.3"
        }
    }
}

provider "hyperv" {
	user     = "${var.username}"
	password = "${var.password}"
	host            = "127.0.0.1"
	#port            = 5985
	#https           = false
	#insecure        = true
	#use_ntlm        = true
	#tls_server_name = ""
	#cacert_path     = ""
	#cert_path       = ""
	#key_path        = ""
	#script_path     = "D:/Playground/Tiko/tkotarpchlg/infrastructure/scripts/terraform_%RAND%.cmd"
	timeout         = "30s"
}
