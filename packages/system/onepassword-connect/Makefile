export NAME=onepassword-connect
export NAMESPACE=bootstack-$(NAME)

include ../../../scripts/package-system.mk

update:
	rm -rf charts
	helm repo add 1password https://1password.github.io/connect-helm-charts
	helm repo update 1password
	helm pull 1password/connect --untar --untardir charts