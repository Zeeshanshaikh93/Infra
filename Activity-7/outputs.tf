output "web_url" {
  value = format("http://%s/woody", aws_instance.web.public_ip)

}

output "ssh_command" {
  value = format(
    "ssh -i %s %s@%s", # Using %s allows for straightforward insertion of string variables into formatted text.
    var.key_file_details.private_key_path,
    var.web_server_info.username,
    aws_instance.web.public_ip
  )
}