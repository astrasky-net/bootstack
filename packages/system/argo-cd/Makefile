export NAME=argo-cd
export NAMESPACE=bootstack-$(NAME)

include ../../../scripts/package-system.mk

update:
	rm -rf charts
	helm repo add argo-cd https://argoproj.github.io/argo-helm
	helm repo update argo-cd
	helm pull argo-cd/argo-cd --untar --untardir charts
