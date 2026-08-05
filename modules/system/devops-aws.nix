# DevOps AWS Real-World Project packages
#
# Herramientas para el curso "Ultimate DevOps Real-World Project
# Implementation on AWS" (stacksimplify).
#
# Repo: /home/fsanabria/git/devops-real-world-project-implementation-on-aws
#
# Cubre: Terraform/OpenTofu (IaC), AWS CLI, Kubernetes, Helm,
# y utilidades de procesamiento (JSON/YAML).
#
# Nota: kubectl, git y unzip ya están en packages.nix — no se duplican aquí.
#
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # -- IaC (Infrastructure as Code) --
    terraform                   # HashiCorp Terraform (unfree, BSL license)
    opentofu                  # Fork open-source de Terraform (comando `tofu`)
    terraform-ls              # HashiCorp Language Server (LSP para editores)
    terraform-docs            # Genera documentación desde módulos .tf
    tfsec                     # Escáner de seguridad para código Terraform

    # -- AWS --
    awscli2                   # AWS CLI v2
    ssm-session-manager-plugin # AWS SSM Session Manager (acceso a EKS/nodos)

    # -- Kubernetes / Helm --
    kubernetes-helm           # Helm 3 — gestor de paquetes para Kubernetes

    # -- Utilidades de procesamiento --
    jq                        # Procesamiento JSON (outputs de Terraform, respuestas AWS)
    yq-go                     # Procesamiento YAML (valores Helm, manifests k8s)
  ];
}
