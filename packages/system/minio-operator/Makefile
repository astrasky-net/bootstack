export NAME=minio-operator
export NAMESPACE=bootstack-$(NAME)

include ../../../scripts/package-system.mk

update:
	rm -rf charts
	helm repo add minio https://operator.min.io/
	helm repo update minio
	helm pull minio/operator --untar --untardir charts