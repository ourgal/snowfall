##@
##@ main
##@

.PHONY: home
home: ##@ home manager switch
	@git add .
	@nh home switch

.PHONY: update
update: ##@ nvfetcher update
	@cache -s "$$(date +%Y-%m-%d)" -- nvfetcher --keyfile keyfile.toml

##@
##@ misc
##@

.PHONY: help
help: ##@ Print listing of key targets with their descriptions
	@printf "\nUsage: make <command>\n"
	@grep -F -h "##@" $(MAKEFILE_LIST) | grep -F -v grep -F | sed -e 's/\\$$//' | awk 'BEGIN {FS = ":*[[:space:]]*##@[[:space:]]*"}; \
	{ \
		if($$2 == "") \
			pass; \
		else if($$0 ~ /^#/) \
			printf "\n%s\n", $$2; \
		else if($$1 == "") \
			printf "     %-20s%s\n", "", $$2; \
		else \
			printf "\n    \033[34m%-20s\033[0m %s\n", $$1, $$2; \
	}'
