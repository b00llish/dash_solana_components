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

require('./SolanaWalletMultiButton.css');
require('@solana/wallet-adapter-react-ui/styles.css');

type Props = {
    // Insert props
    network: 'devnet' | 'mainnet' | 'testnet';
    publicKeyState?: string | null;  // <-- Add ? to make this property optional
    setProps: (props: {publicKeyState?: string}) => void;
} & DashComponentProps;

/**
 * Component description
 */

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

const Context: FC<{ children: ReactNode, network: WalletAdapterNetwork, onPublicKeyUpdate: (publicKey: string | null) => void }> = ({ children, network , onPublicKeyUpdate }) => {
    // The network can be set to 'devnet', 'testnet', or 'mainnet-beta'.
    // const network = WalletAdapterNetwork.Devnet;

    // Can provide a custom RPC endpoint here.
    const endpoint = useMemo(() => clusterApiUrl(network), [network]);

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

const Content: FC<{ onPublicKeyUpdate: any }> = ({ onPublicKeyUpdate }) => {
    const { publicKey, connected } = useWallet();

    useEffect(() => {
        if (connected) {
            // If the wallet is connected, `publicKey` will be defined.
            // You can then pass `publicKey` to a callback function, or use it in some other way.
            const publicKeyString = publicKey?.toString();
            console.log(publicKeyString);
            onPublicKeyUpdate(publicKeyString);
        }
    }, [connected, publicKey, onPublicKeyUpdate]);

    return (
        <div className="SolanaWalletMultiButton">
            <WalletMultiButton />
        </div>
    );
};