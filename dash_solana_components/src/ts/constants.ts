import { WalletAdapterNetwork } from '@solana/wallet-adapter-base';

/**
 * SolanaWalletMultiButton is a functional React component that provides an interface to
 * interact with different Solana wallets.
 *
 * It handles connection, disconnection, and returns the public key of the connected wallet.
 *
 * When connected, the public key is made available through a prop, "publicKeyState".
 * When disconnected, 'null' is displayed.
 */
// Define network values
export const NETWORKS = {
    'devnet': WalletAdapterNetwork.Devnet,
    'mainnet': WalletAdapterNetwork.Mainnet,
    'testnet': WalletAdapterNetwork.Testnet,
};
