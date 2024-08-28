export NAME=etcd-operator
export NAMESPACE=bootstack-${NAME}

include ../../../scripts/package.mk

update:
	rm -rf charts
	helm pull oci://ghcr.io/astrasky-net/charts/etcd-operator --untar --untardir charts
