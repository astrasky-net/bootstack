export NAME=postgres-operator
export NAMESPACE=bootstack-$(NAME)

include ../../../scripts/package.mk

update:
	rm -rf charts
	helm repo add cnpg https://cloudnative-pg.github.io/charts
	helm repo update cnpg
	helm pull cnpg/cloudnative-pg --untar --untardir charts
