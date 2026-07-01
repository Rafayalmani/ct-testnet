FROM ethereum/client-go:latest

WORKDIR /root/.ethereum

# Copy genesis configuration
COPY geth-init/genesis.json /config/genesis.json
COPY geth-init/config.toml /config/config.toml

# Initialize blockchain
RUN geth init --datadir=/root/.ethereum /config/genesis.json

# Expose ports
EXPOSE 8545 8546 30303 30303/udp

# Health check
HEALTHCHECK --interval=10s --timeout=5s --retries=5 \
  CMD geth attach http://localhost:8545 -exec "eth.blockNumber"

# Run geth
CMD ["geth", "--datadir=/root/.ethereum", "--config=/config/config.toml"]
