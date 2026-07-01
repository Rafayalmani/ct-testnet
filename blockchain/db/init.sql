-- Create blockchain metadata table
CREATE TABLE IF NOT EXISTS blockchain_metadata (
  id SERIAL PRIMARY KEY,
  key VARCHAR(255) UNIQUE NOT NULL,
  value TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create blocks table
CREATE TABLE IF NOT EXISTS blocks (
  number BIGINT PRIMARY KEY,
  hash VARCHAR(66) UNIQUE NOT NULL,
  parent_hash VARCHAR(66),
  timestamp BIGINT,
  miner VARCHAR(42),
  gas_used BIGINT,
  gas_limit BIGINT,
  transaction_count INT,
  difficulty VARCHAR(100),
  total_difficulty VARCHAR(100),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_blocks_hash ON blocks(hash);
CREATE INDEX idx_blocks_timestamp ON blocks(timestamp DESC);

-- Create transactions table
CREATE TABLE IF NOT EXISTS transactions (
  hash VARCHAR(66) PRIMARY KEY,
  block_number BIGINT REFERENCES blocks(number),
  from_address VARCHAR(42),
  to_address VARCHAR(42),
  value NUMERIC(78, 0),
  gas BIGINT,
  gas_price NUMERIC(78, 0),
  transaction_index INT,
  input TEXT,
  nonce BIGINT,
  status INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_transactions_from ON transactions(from_address);
CREATE INDEX idx_transactions_to ON transactions(to_address);
CREATE INDEX idx_transactions_block ON transactions(block_number);

-- Create receipts table
CREATE TABLE IF NOT EXISTS receipts (
  transaction_hash VARCHAR(66) PRIMARY KEY REFERENCES transactions(hash),
  block_number BIGINT,
  block_hash VARCHAR(66),
  gas_used BIGINT,
  cumulative_gas_used BIGINT,
  contract_address VARCHAR(42),
  logs_count INT,
  status INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_receipts_block ON receipts(block_number);

-- Create logs table
CREATE TABLE IF NOT EXISTS logs (
  id SERIAL PRIMARY KEY,
  transaction_hash VARCHAR(66) REFERENCES transactions(hash),
  block_number BIGINT,
  log_index INT,
  address VARCHAR(42),
  topic0 VARCHAR(66),
  topic1 VARCHAR(66),
  topic2 VARCHAR(66),
  topic3 VARCHAR(66),
  data TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_logs_address ON logs(address);
CREATE INDEX idx_logs_tx_hash ON logs(transaction_hash);
CREATE INDEX idx_logs_topic0 ON logs(topic0);

-- Create contracts table
CREATE TABLE IF NOT EXISTS contracts (
  address VARCHAR(42) PRIMARY KEY,
  creator_address VARCHAR(42),
  creation_block BIGINT,
  creation_tx_hash VARCHAR(66),
  bytecode TEXT,
  abi TEXT,
  name VARCHAR(255),
  symbol VARCHAR(20),
  decimals INT,
  total_supply NUMERIC(78, 0),
  is_verified BOOLEAN DEFAULT FALSE,
  verification_source TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_contracts_creator ON contracts(creator_address);

-- Create tokens (ERC-20, ERC-721, etc.) table
CREATE TABLE IF NOT EXISTS tokens (
  address VARCHAR(42) PRIMARY KEY REFERENCES contracts(address),
  token_type VARCHAR(20),
  name VARCHAR(255),
  symbol VARCHAR(20),
  decimals INT,
  total_supply NUMERIC(78, 0),
  holder_count BIGINT DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create token transfers table
CREATE TABLE IF NOT EXISTS token_transfers (
  id SERIAL PRIMARY KEY,
  token_address VARCHAR(42) REFERENCES tokens(address),
  from_address VARCHAR(42),
  to_address VARCHAR(42),
  value NUMERIC(78, 0),
  block_number BIGINT,
  transaction_hash VARCHAR(66),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_token_transfers_from ON token_transfers(from_address);
CREATE INDEX idx_token_transfers_to ON token_transfers(to_address);
CREATE INDEX idx_token_transfers_token ON token_transfers(token_address);
CREATE INDEX idx_token_transfers_block ON token_transfers(block_number);

-- Create token holders table
CREATE TABLE IF NOT EXISTS token_holders (
  id SERIAL PRIMARY KEY,
  token_address VARCHAR(42) REFERENCES tokens(address),
  holder_address VARCHAR(42),
  balance NUMERIC(78, 0),
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE UNIQUE INDEX idx_token_holders_unique ON token_holders(token_address, holder_address);

-- Create addresses table
CREATE TABLE IF NOT EXISTS addresses (
  address VARCHAR(42) PRIMARY KEY,
  balance NUMERIC(78, 0),
  nonce BIGINT,
  is_contract BOOLEAN DEFAULT FALSE,
  transaction_count BIGINT DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_addresses_updated ON addresses(updated_at DESC);

-- Create validators table
CREATE TABLE IF NOT EXISTS validators (
  address VARCHAR(42) PRIMARY KEY,
  public_key VARCHAR(130),
  voting_power NUMERIC(78, 0),
  blocks_proposed BIGINT DEFAULT 0,
  last_proposed BIGINT,
  status VARCHAR(20),
  joined_block BIGINT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create faucet requests table
CREATE TABLE IF NOT EXISTS faucet_requests (
  id SERIAL PRIMARY KEY,
  address VARCHAR(42) NOT NULL,
  amount NUMERIC(78, 0),
  transaction_hash VARCHAR(66),
  status VARCHAR(20),
  ip_address VARCHAR(45),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_faucet_requests_address ON faucet_requests(address);
CREATE INDEX idx_faucet_requests_created ON faucet_requests(created_at DESC);
CREATE INDEX idx_faucet_requests_status ON faucet_requests(status);

-- Create audit logs table
CREATE TABLE IF NOT EXISTS audit_logs (
  id SERIAL PRIMARY KEY,
  user_address VARCHAR(42),
  action VARCHAR(255),
  resource_type VARCHAR(100),
  resource_id VARCHAR(255),
  details TEXT,
  ip_address VARCHAR(45),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_audit_logs_user ON audit_logs(user_address);
CREATE INDEX idx_audit_logs_action ON audit_logs(action);
CREATE INDEX idx_audit_logs_created ON audit_logs(created_at DESC);
