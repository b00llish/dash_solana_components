import type { Adapter, WalletError } from '@solana/wallet-adapter-base';
import { WalletAdapterNetwork } from '@solana/wallet-adapter-base';
import { ConnectionProvider, WalletProvider } from '@solana/wallet-adapter-react';
import { WalletModalProvider } from '@solana/wallet-adapter-react-ui';
import { type SolanaSignInInput } from '@solana/wallet-standard-features';
import { verifySignIn } from '@solana/wallet-standard-util';
import { clusterApiUrl } from '@solana/web3.js';
import React, { FC, useCallback, useMemo } from 'react';
import { createSignInData } from '../utils/createSignInData';
import { NETWORKS } from '../constants';
import { WalletContextProviderProps } from "../props/contextProvider";

type Props = {
    network?: WalletAdapterNetwork;
    rpcEndpoint?: string;
    children: React.ReactNode;
} & WalletContextProviderProps;


// The WalletContextProvider component is responsible for providing the necessary wallet connections 
// and context to its child components (passed as the `children` prop).
// const WalletContextProvider: FC<{ children: ReactNode; network: WalletAdapterNetwork; rpcEndpoint?: string; }> = ( props: Props ) => {
const WalletContextProvider: FC<Props> = (props: Props) => {
    const { children, network, rpcEndpoint } = props;

    // Map the network prop to the corresponding network value. 
    // NETWORKS is a predefined mapping of network names to their values.
    const networkValue = NETWORKS[network];

    // Compute the endpoint. If `rpcEndpoint` is provided, use it. Otherwise, get the default URL for the specified network.
    // The `useMemo` hook is used to recompute the endpoint only when `rpcEndpoint` or `network` changes.
    const endpoint = useMemo(
        () => rpcEndpoint || clusterApiUrl(networkValue), [networkValue, rpcEndpoint]
    );

    const wallets = useMemo(
        () => [], [network]
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

    return (
        <ConnectionProvider endpoint={endpoint}>
            <WalletProvider wallets={wallets} onError={onError} autoConnect={autoConnect}>
                <WalletModalProvider>
                    {children}
                </WalletModalProvider>
            </WalletProvider>
        </ConnectionProvider>
    );
};

WalletContextProvider.defaultProps = {};

export default WalletContextProvider;
