export NAME=argo-cd
export NAMESPACE=bootstack-$(NAME)

include ../../../scripts/package-system.mk

update:
	rm -rf charts
	helm repo add atlassian https://atlassian.github.io/data-center-helm-charts
	helm repo update atlassian
	helm pull atlassian/confluence --untar --untardir charts
