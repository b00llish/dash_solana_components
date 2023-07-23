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
    initialPublicKeyState: string | null;
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
    const { id, network, initialPublicKeyState } = props;
    const networkValue = NETWORKS[network];

    const [publicKeyState, setPublicKeyState] = useState(initialPublicKeyState);

    const handlePublicKeyUpdate = (publicKey: string | null) => {
        setPublicKeyState(publicKey);
    };

    return (
        <div id={id}>
            <Context network={networkValue} onPublicKeyUpdate={handlePublicKeyUpdate}>
                <Content onPublicKeyUpdate={handlePublicKeyUpdate} />
            </Context>
        </div>
    );
};

SolanaWalletMultiButton["defaultProps"] = {network: 'mainnet', initialPublicKeyState: null };

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

const Content: FC<{ onPublicKeyUpdate: (publicKey: string | null) => void }> = ({ onPublicKeyUpdate }) => {
    const { publicKey, connected } = useWallet();

    useEffect(() => {
        if (connected) {
            const publicKeyString = publicKey?.toString() || null;
            console.log(publicKeyString);
            onPublicKeyUpdate(publicKeyString);
        }
    }, [connected, publicKey]);

    return (
        <div className="SolanaWalletMultiButton">
            <WalletMultiButton />
        </div>
    );
};