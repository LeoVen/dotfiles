# Terraform Skill for Claude

Comprehensive Terraform and OpenTofu best practices skill for Claude Code. Get instant guidance on testing strategies, module patterns, CI/CD workflows, and production-ready infrastructure code.

## What This Skill Provides

🧪 **Testing Frameworks**
- Decision matrix for choosing between native tests and Terratest
- Testing strategy workflows (static → integration → E2E)
- Real-world examples and patterns

📦 **Module Development**
- Structure and naming conventions
- Versioning strategies
- Public vs private module patterns

🔄 **CI/CD Integration**
- GitHub Actions workflows
- GitLab CI examples
- Cost optimization patterns
- Compliance automation

🔒 **Security & Compliance**
- Trivy, Checkov integration
- Policy-as-code patterns
- Compliance scanning workflows

📋 **Quick Reference**
- Decision flowcharts
- Common patterns (✅ DO vs ❌ DON'T)
- Cheat sheets for rapid consultation

## Quick Start Examples

**Create a module with tests:**
> "Create a Terraform module for AWS VPC with native tests"

**Review existing code:**
> "Review this Terraform configuration following best practices"

**Generate CI/CD workflow:**
> "Create a GitHub Actions workflow for Terraform with cost estimation"

**Testing strategy:**
> "Help me choose between native tests and Terratest for my modules"

## What It Covers

### Testing Strategy Framework

Decision matrices for:
- When to use native tests (Terraform 1.6+)
- When to use Terratest (Go-based)
- Multi-environment testing patterns

### Module Development Patterns

- Naming conventions (`terraform-<PROVIDER>-<NAME>`)
- Directory structure best practices
- Input variable organization
- Output value design
- Version constraint patterns
- Documentation standards

### CI/CD Workflows

- GitHub Actions examples
- GitLab CI templates
- Atlantis integration
- Cost estimation (Infracost)
- Security scanning (Trivy, Checkov)
- Compliance checking

### Security & Compliance

- Static analysis integration
- Policy-as-code patterns
- Secrets management
- State file security
- Compliance scanning workflows

### Common Patterns & Anti-patterns

Side-by-side ✅ DO vs ❌ DON'T examples for:
- Variable naming
- Resource naming
- Module composition
- State management
- Provider configuration

## Related Resources

### Official Documentation
- [Terraform Language](https://developer.hashicorp.com/terraform/docs) - HashiCorp official docs
- [Terraform Testing](https://developer.hashicorp.com/terraform/language/tests) - Native test framework
- [OpenTofu Documentation](https://opentofu.org/docs/) - OpenTofu official docs
- [HashiCorp Best Practices](https://developer.hashicorp.com/terraform/cloud-docs/recommended-practices) - Cloud best practices

### Community Resources
- [Awesome Terraform](https://github.com/shuaibiyy/awesome-tf)
- [Terraform Best Practices](https://terraform-best-practices.com) - Comprehensive guide (base for this skill)
- [terraform-aws-modules](https://github.com/terraform-aws-modules) - Production-grade AWS modules
- [Terratest](https://terratest.gruntwork.io/docs/) - Go testing framework for Terraform
- [Google Cloud Best Practices](https://docs.cloud.google.com/docs/terraform/best-practices/general-style-structure)
- [AWS Terraform Best Practices](https://docs.aws.amazon.com/prescriptive-guidance/latest/terraform-aws-provider-best-practices/introduction.html)

### Development Tools
- [pre-commit-terraform](https://github.com/antonbabenko/pre-commit-terraform) - Pre-commit hooks for Terraform
- [terraform-docs](https://terraform-docs.io/) - Generate documentation from Terraform modules
- [terraform-switcher](https://github.com/warrensbox/terraform-switcher) - Terraform version manager
- [TFLint](https://github.com/terraform-linters/tflint) - Terraform linter
- [Trivy](https://github.com/aquasecurity/trivy) - Security scanner for IaC

