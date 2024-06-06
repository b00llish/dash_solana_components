import type { Adapter, WalletError } from '@solana/wallet-adapter-base';
import { WalletAdapterNetwork } from '@solana/wallet-adapter-base';
import { ConnectionProvider, WalletProvider } from '@solana/wallet-adapter-react';
import { WalletModalProvider } from '@solana/wallet-adapter-react-ui';
import {
    // UnsafeBurnerWalletAdapter,
    PhantomWalletAdapter,
    SolflareWalletAdapter,
    LedgerWalletAdapter
} from '@solana/wallet-adapter-wallets';
import { type SolanaSignInInput } from '@solana/wallet-standard-features';
import { verifySignIn } from '@solana/wallet-standard-util';
import { clusterApiUrl } from '@solana/web3.js';
import React, { FC, ReactNode, useCallback, useMemo } from 'react';
import { AutoConnectProvider, useAutoConnect } from './AutoConnectProvider';
import { Content } from './Content';
import { createSignInData } from '../utils/createSignInData';

// The WalletContextProvider component is responsible for providing the necessary wallet connections 
// and context to its child components (passed as the `children` prop).
export const WalletContextProvider: FC<{ children: ReactNode; network: WalletAdapterNetwork; onPublicKeyUpdate: (publicKey: string | null) => void; rpcEndpoint?: string; }> = ({ children, network, onPublicKeyUpdate, rpcEndpoint }) => {
// export const WalletContextProvider: FC<{ children: ReactNode; network: WalletAdapterNetwork; onPublicKeyUpdate: (publicKey: string | null) => void; rpcEndpoint?: string; }> = ({ children, network, rpcEndpoint }) => {    
    
    // The useAutoConnect hook is used to manage the auto-connect state of the wallet.
    // Adapted from: https://github.com/anza-xyz/wallet-adapter/blob/master/packages/starter/example/src/components/ContextProvider.tsx
    // const { autoConnect } = useAutoConnect();

    // The network can be set to 'devnet', 'testnet', or 'mainnet-beta'.
    // Can provide a custom RPC endpoint here.
    // Compute the endpoint. If `rpcEndpoint` is provided, use it. Otherwise, get the default URL for the specified network.
    // The `useMemo` hook is used to recompute the endpoint only when `rpcEndpoint` or `network` changes.
    const endpoint = useMemo(() => rpcEndpoint || clusterApiUrl(network), [network, rpcEndpoint]);

    // Usage example with custom RPC endpoint:
    // <Context rpcEndpoint="https://example.com/custom-endpoint" ...otherProps />
    // This useMemo defines the array of wallets our app will support.
    // The array is redefined only when the network changes.
    const wallets = useMemo(
        () => [
            // new UnsafeBurnerWalletAdapter(),
            // new PhantomWalletAdapter(),
            // new SolflareWalletAdapter(),
            // new LedgerWalletAdapter(),
        ],
        // eslint-disable-next-line react-hooks/exhaustive-deps
        [network]
    );

    const onError = useCallback(
        (error: WalletError, adapter?: Adapter) => {
            console.error(error, adapter);
        },
        []
    );

    const autoSignIn = useCallback(async (adapter: Adapter) => {
        if (!('signIn' in adapter)) return true;
        const input: SolanaSignInInput = await createSignInData();
        // const input: SolanaSignInInput = {
        //     domain: window.location.host,
        //     address: adapter.publicKey ? adapter.publicKey.toBase58() : undefined,
        //     statement: 'Please sign in.',
        // };
        const output = await adapter.signIn(input);

        if (!verifySignIn(input, output)) throw new Error('Sign In verification failed!');

        return false;
    }, []);

    const autoConnect = useCallback(async (adapter: Adapter) => {
        adapter.autoConnect().catch((e) => {
          return autoSignIn(adapter);
        });
        return false;
      }, [autoSignIn]);

    // The ConnectionProvider, WalletProvider, and WalletModalProvider components
    // are part of the @solana/wallet-adapter-react library. They provide the necessary
    // context and functionality for the WalletMultiButton and useWallet hook to function.
    return (
        <ConnectionProvider endpoint={endpoint}>
            <WalletProvider wallets={wallets} onError={onError} autoConnect={autoConnect}>
                <WalletModalProvider>
                    {
                        // Render the children components with the necessary context and props.
                        // children
                    <Content onPublicKeyUpdate={onPublicKeyUpdate} />
                    }
                </WalletModalProvider>
            </WalletProvider>
        </ConnectionProvider>
    );
};

export const ContextProvider: FC<{ children: ReactNode; network: WalletAdapterNetwork; onPublicKeyUpdate: (publicKey: string | null) => void; rpcEndpoint?: string; }> = ({ children, network, onPublicKeyUpdate, rpcEndpoint }) => {
    return (
                    <AutoConnectProvider>
                        <WalletContextProvider network={network} onPublicKeyUpdate={onPublicKeyUpdate} rpcEndpoint={rpcEndpoint}>
                            {children}
                        </WalletContextProvider>
                    </AutoConnectProvider>
            
    );
};
