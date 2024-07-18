export NAME=kafka-operator
export NAMESPACE=bootstack-$(NAME)

include ../../../scripts/package-system.mk

update:
	rm -rf charts
	helm pull oci://quay.io/strimzi-helm/strimzi-kafka-operator --untar --untardir charts
