provider "aws" {
  region     = "us-west-2"
}

resource "aws_instance" "first-ec2" {
  ami = "ami-0efa651876de2a5ce"
  instance_type = "t2.micro"
  key_name = "deployer-key"

  tags = {
    Name = "instance-name"
  }

  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDoFYHy4lJyBNpLePU+4kLFqkcyhOH80se1GTfTXKj9Fbc0vNy4hITJWn12kbwDlQCxJaxtpsyv6hHAR8al2iRHWjSL1MbLVLXhsR5eQFlUBt5cBz6WwoSuEpp51P4JLhsrLhm5QtFZVD8uJcy2FA8RAZpMmH8G8t99Du5J1aAD38tvFX2ZnatXzBzRrfLSyOMnHu3Vk1VD5khlv3lJwqtrA9VQu3lJw1jrmxvE55AT3tQJBegGquaZPqTFZkB6nc6PW2bRSFnDBRX+btbUt6QA9IRs7q3hX8mz8D7G9vQb9VZIgJTcgLo9FzkL0R7ObOri+WalwxiWAXSIxYzqfX8/ptlvxBi/ebt84LIf3p2KpgwNMTJWhDchJ80bmJTlAfvwtQQM/Z6tvOfRZnVXfOMCOjso7ZS4Bewz8YO3FA4TOmoCH/6GBvDEu4EHnCcCSyWM0gEQCmm0JNWYBctQ3cw4ehENl2bwtfv8nGLmtuA5HXb8wfO+P0VomW86J5zGPws= razvanonet@macbookpro"
}

resource "aws_security_group" "allow-ssh" {
  name = "allow-ssh"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

output "vm-ip" {
  value = aws_instance.first-ec2.public_ip
}

