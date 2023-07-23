/**
 * This file contains a React component for a Solana Wallet Multi Button, which provides
 * an interface to interact with different Solana wallets and return a public key when connected.
 * This component uses the '@solana/wallet-adapter-react' library to handle wallet interactions.
 */

// Import required modules
import { WalletAdapterNetwork } from '@solana/wallet-adapter-base';
import { ConnectionProvider, WalletProvider } from '@solana/wallet-adapter-react';
import { WalletModalProvider, WalletMultiButton, WalletDisconnectButton } from '@solana/wallet-adapter-react-ui';
import {
    PhantomWalletAdapter,
    SolflareWalletAdapter,
    LedgerWalletAdapter,
    BackpackWalletAdapter,
    WalletConnectWalletAdapter,
    UnsafeBurnerWalletAdapter, } from '@solana/wallet-adapter-wallets';
import { clusterApiUrl } from '@solana/web3.js';
import React, {useState, FC, ReactNode, useEffect, useMemo} from 'react';
import { useWallet } from '@solana/wallet-adapter-react';
import {DashComponentProps} from '../props';

// Import required stylesheets  
require('./SolanaWalletMultiButton.css');
require('@solana/wallet-adapter-react-ui/styles.css');

/**
 * Define component properties.
 * The component receives a network prop which can be one of 'devnet', 'mainnet', 'testnet',
 * and a publicKeyState prop which is used to store and provide the public key state.
 */
type Props = {
    // Insert props
    network: 'devnet' | 'mainnet' | 'testnet';
    publicKeyState?: string | null;  // <-- Add ? to make this property optional
    setProps: (props: {publicKeyState?: string}) => void;
} & DashComponentProps;

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
const NETWORKS = {
  'devnet': WalletAdapterNetwork.Devnet,
  'mainnet': WalletAdapterNetwork.Mainnet,
  'testnet': WalletAdapterNetwork.Testnet,
};

const SolanaWalletMultiButton: (props: Props) => JSX.Element = (props: Props) => {
    const { id, network, setProps } = props;
    const networkValue = NETWORKS[network];

    const handlePublicKeyUpdate = (publicKey) => {
        if (setProps) setProps({ publicKeyState: publicKey });
    };

    return (
        <div id={id}>
            <Context network={networkValue} onPublicKeyUpdate={handlePublicKeyUpdate}>
                <Content onPublicKeyUpdate={handlePublicKeyUpdate} />
            </Context>
        </div>
    );
};

SolanaWalletMultiButton["defaultProps"] = {network: 'mainnet', PublicKeyState: null };

export default SolanaWalletMultiButton;

// The Context component is responsible for providing the necessary wallet connections 
// and context to its child components (passed as the `children` prop).
const Context: FC<{ children: ReactNode, network: WalletAdapterNetwork, onPublicKeyUpdate: (publicKey: string | null) => void }> = ({ children, network , onPublicKeyUpdate }) => {
    
    // The network can be set to 'devnet', 'testnet', or 'mainnet-beta'.
    // Can provide a custom RPC endpoint here.
    // The `useMemo` hook is used to recompute the endpoint only when the network value changes.
    const endpoint = useMemo(() => clusterApiUrl(network), [network]);

    // This useMemo defines the array of wallets our app will support.
    // The array is redefined only when the network changes.
    const wallets = useMemo(
        () => [
            new PhantomWalletAdapter(),
            new SolflareWalletAdapter(),
            new BackpackWalletAdapter(),
            new LedgerWalletAdapter(),
            // new UnsafeBurnerWalletAdapter(),
        ],
        // eslint-disable-next-line react-hooks/exhaustive-deps
        [network]
    );

    // The ConnectionProvider, WalletProvider, and WalletModalProvider components
    // are part of the @solana/wallet-adapter-react library. They provide the necessary
    // context and functionality for the WalletMultiButton and useWallet hook to function.
    return (
        <ConnectionProvider endpoint={endpoint}>
            <WalletProvider wallets={wallets} autoConnect>
                <WalletModalProvider>
                    <Content onPublicKeyUpdate={onPublicKeyUpdate}/>
                </WalletModalProvider>
            </WalletProvider>
        </ConnectionProvider>
    );
};

// The Content component renders the WalletMultiButton and also monitors the connection status 
// and public key of the wallet via the `useWallet` hook.
const Content: FC<{ onPublicKeyUpdate: (publicKey: string | null) => void }> = ({ onPublicKeyUpdate }) => {
    
    // The useWallet hook provides the `publicKey` of the connected wallet and a boolean
    // `connected` indicating the connection status.
    const { publicKey, connected } = useWallet();

    // This effect runs every time the `connected`, `publicKey`, or `onPublicKeyUpdate` values change.
    // If a wallet is connected, it converts the public key to a string and passes it to the `onPublicKeyUpdate` function.
    useEffect(() => {
        if (connected) {
            const publicKeyString = publicKey?.toString();
            console.log(publicKeyString);
            onPublicKeyUpdate(publicKeyString);
        } else {
            onPublicKeyUpdate(null);
        }
    }, [connected, publicKey, onPublicKeyUpdate]);

    // This component renders the WalletMultiButton, which provides the user interface 
    // for connecting and disconnecting wallets.
    return (
        <div className="SolanaWalletMultiButton">
            <WalletMultiButton />
        </div>
    );
};