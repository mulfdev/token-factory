# Load environment variables from .env
ifneq ("$(wildcard .env)", "")
    include .env
    export $(shell sed 's/=.*//' .env)
endif

# Ensure PRIVATE_KEY and RPC_URL are set
ifndef PRIVATE_KEY
  $(error PRIVATE_KEY is not set. Please set it in the .env file or environment)
endif
ifndef RPC_URL
  $(error RPC_URL is not set. Please set it in the .env file or environment)
endif

# Define common forge flags
FORGE_FLAGS=--rpc-url $(RPC_URL) --broadcast --private-key $(PRIVATE_KEY)

# Generic forge command target
forge:
	@forge $(CMD) $(FORGE_FLAGS)

