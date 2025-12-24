resource "aws_codeartifact_domain" "aws-codeartifact-domain" {
  domain = "domain-terraform"
}
  
resource "aws_codeartifact_repository" "aws-codeartifact-repository" {
   repository = "repository-terraform"
  domain = aws_codeartifact_domain.aws-codeartifact-domain.domain
  external_connections {
    external_connection_name = "public:maven-central"
  }
}