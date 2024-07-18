NAME=fluxcd
NAMESPACE=bootstack-$(NAME)

apply-locally:
	helm upgrade -i -n $(NAMESPACE) $(NAME) .

include ../../../scripts/package-system.mk
