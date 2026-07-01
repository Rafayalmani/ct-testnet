# CT Chain Testnet 🚀

A production-quality, fully functional EVM-compatible blockchain testnet with a professional UI, smart contract support, MetaMask integration, block explorer, faucet, and validator dashboard.

## 🎯 Quick Start

```bash
# Clone the repository
git clone https://github.com/Rafayalmani/ct-testnet.git
cd ct-testnet

# Start the entire stack with Docker Compose
docker-compose up -d

# Or for local development
npm install
npm run dev
```

**Access Points:**
- 🔗 RPC Endpoint: `http://localhost:8545`
- 🔍 Block Explorer: `http://localhost:3001`
- 💧 Faucet: `http://localhost:3002`
- 📊 Validator Dashboard: `http://localhost:3003`
- 📡 Websocket: `ws://localhost:8546`

## 📋 Network Information

| Property | Value |
|----------|-------|
| **Network Name** | CT Chain Testnet |
| **Native Coin** | CT |
| **Symbol** | CT |
| **Chain ID** | 7777 |
| **Network ID** | 7777 |
| **Block Time** | 2 seconds |
| **Gas Token** | CT |
| **Max Gas Limit** | 30,000,000 |
| **Consensus** | Proof of Authority |
| **Pre-funded Genesis** | 100,000,000 CT |
| **Decimals** | 18 |

## 🏗️ Project Structure

```
ct-testnet/
├── blockchain/                 # Geth-based EVM blockchain
│   ├── geth-init/             # Genesis configuration
│   ├── validators/            # Validator node configs
│   └── data/                  # Blockchain data
├── packages/
│   ├── explorer/              # Next.js block explorer
│   ├── faucet/                # React faucet frontend
│   ├── dashboard/             # Validator dashboard
│   ├── api/                   # REST API service
│   ├── indexer/               # Blockchain indexer
│   └── contracts/             # Smart contract templates
├── docker/                    # Docker configurations
├── scripts/                   # Deployment & utility scripts
├── docs/                      # Complete documentation
├── docker-compose.yml         # Full stack orchestration
├── package.json              # Monorepo root
└── .github/workflows/         # CI/CD pipelines
```

## ✨ Core Features

### 🔗 Blockchain
- ✅ Geth-based EVM-compatible chain
- ✅ Genesis block with pre-funded accounts
- ✅ Multiple validator nodes (3+ configurable)
- ✅ Peer discovery and synchronization
- ✅ JSON-RPC API (full Ethereum compatibility)
- ✅ WebSocket support (real-time updates)
- ✅ Transaction pool management
- ✅ Gas estimation and fees
- ✅ Smart contract deployment
- ✅ 2-second block time

### 👛 Wallet Integration
- ✅ **MetaMask** - Full compatibility with network config
- ✅ **Rabby Wallet** - Built-in support
- ✅ **Coinbase Wallet** - Complete integration
- ✅ **WalletConnect** - Multi-chain support
- ✅ **Custom wallet** - Via Web3.js/ethers.js
- ✅ Account creation and management
- ✅ Private key secure storage

### 📝 Smart Contracts
- ✅ **ERC-20** - Standard token contract
- ✅ **ERC-721** - NFT contract
- ✅ **ERC-1155** - Multi-token standard
- ✅ **Multisig Wallet** - Multi-signature security
- ✅ **Time Lock** - Delayed execution
- ✅ **Staking Contract** - Reward mechanism
- ✅ **Treasury Contract** - Fund management
- ✅ **Hardhat deployment** - Easy deployment scripts
- ✅ **Etherscan-verified** - Contract verification

### 🔍 Block Explorer
- ✅ Browse all blocks
- ✅ Transaction details & status
- ✅ Address & contract information
- ✅ Token holders & balances
- ✅ NFT display & metadata
- ✅ Internal transactions
- ✅ Gas analytics & charts
- ✅ Full-text search
- ✅ REST API
- ✅ GraphQL API
- ✅ Real-time updates (WebSocket)
- ✅ Contract verification
- ✅ Transaction tracing

### 💧 Faucet
- ✅ Beautiful React UI
- ✅ Wallet connection (MetaMask, WalletConnect)
- ✅ reCAPTCHA v3 protection
- ✅ Rate limiting (1 claim per 24h per address)
- ✅ Queue system (fair distribution)
- ✅ Balance monitoring
- ✅ Transaction history
- ✅ Real-time status updates
- ✅ Admin dashboard
- ✅ Transaction analytics

### 📊 Validator Dashboard
- ✅ Real-time validator list
- ✅ Voting power display
- ✅ Block production metrics
- ✅ Uptime percentage
- ✅ Peer connectivity status
- ✅ Validator rewards tracking
- ✅ Node logs viewer
- ✅ Health status monitoring
- ✅ Performance charts
- ✅ Network statistics
- ✅ Alert system

### 🔐 Security
- ✅ HTTPS/TLS support
- ✅ JWT authentication (optional)
- ✅ Rate limiting (DDoS protection)
- ✅ Input validation & sanitization
- ✅ Secure key storage (encrypted)
- ✅ Comprehensive audit logging
- ✅ Automated backups
- ✅ Firewall configurations
- ✅ SQL injection prevention
- ✅ XSS protection
- ✅ CORS configuration

## 🛠️ Technology Stack

### Blockchain
- **Geth** (Go Ethereum) - EVM implementation
- **Solidity** - Smart contract language

### Backend
- **Node.js** 18+ - Runtime
- **Express.js** - REST API framework
- **TypeScript** - Type safety
- **PostgreSQL** - Data persistence
- **Redis** - Caching & rate limiting
- **Bull** - Job queue for transactions
- **ethers.js** - Ethereum interactions
- **web3.js** - Web3 utilities

### Frontend
- **Next.js 14** - React framework
- **React 18** - UI library
- **Tailwind CSS** - Styling
- **ShadcnUI** - Component library
- **recharts** - Data visualization
- **wagmi** - Wallet connection
- **viem** - Ethereum library

### Infrastructure
- **Docker** - Containerization
- **Docker Compose** - Orchestration
- **Nginx** - Reverse proxy
- **GitHub Actions** - CI/CD

## 📖 Documentation

Complete documentation available in `docs/`:

- **[Setup Guide](docs/01-SETUP.md)** - Installation and configuration
- **[API Reference](docs/02-API_REFERENCE.md)** - Complete API documentation
- **[Smart Contracts](docs/03-SMART_CONTRACTS.md)** - Contract deployment
- **[Troubleshooting](docs/04-TROUBLESHOOTING.md)** - Common issues

## 📄 License

MIT License

---

**Made with ❤️ for blockchain developers**
