resource "aws_key_pair" "deployer" {
  key_name   = "summarizer-key"
  public_key = file("${path.module}/summarizer-key.pub")
}