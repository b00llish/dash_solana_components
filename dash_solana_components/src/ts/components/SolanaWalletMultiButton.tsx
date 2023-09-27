/**
 * This file contains a React component for a Solana Wallet Multi Button, which provides
 * an interface to interact with different Solana wallets and return a public key when connected.
 * This component uses the '@solana/wallet-adapter-react' library to handle wallet interactions.
 */

// Import required modules
import { WalletAdapterNetwork } from '@solana/wallet-adapter-base';
import { ConnectionProvider, WalletProvider } from '@solana/wallet-adapter-react';
import { WalletModalProvider, WalletMultiButton, WalletDisconnectButton } from '@solana/wallet-adapter-react-ui';
import { UnsafeBurnerWalletAdapter } from '@solana/wallet-adapter-wallets';
    
    
import { clusterApiUrl } from '@solana/web3.js';
import React, {useState, FC, ReactNode, useEffect, useMemo} from 'react';
import { useWallet } from '@solana/wallet-adapter-react';
import {DashComponentProps} from '../props';

// Import required stylesheets  
// require('./SolanaWalletMultiButton.css');
require('@solana/wallet-adapter-react-ui/styles.css');

/**
 * Define component properties.
 * The component receives a network prop which can be one of 'devnet', 'mainnet', 'testnet',
 * and a publicKeyState prop which is used to store and provide the public key state.
 */
type Props = {
    /**
   * The network for the wallet.
   *
   * This prop specifies the network for the wallet. It can be 'devnet', 'mainnet', or 'testnet'.
   */
    network: 'devnet' | 'mainnet' | 'testnet';
    
     /**
   * The state of the public key.
   *
   * This prop holds the state of the public key. It could be a string representing
   * the public key, or null if there is no public key.
   */
    publicKeyState?: string | null;  // <-- Add ? to make this property optional

    /**
     * The custom RPC endpoint for the wallet.
     *
     * This prop specifies a custom RPC endpoint for the wallet. If it's not provided, 
     * the default endpoint for the specified network will be used.
     */
    rpcEndpoint?: string;

    /**
   * A function to update the component's properties.
   *
   * Dash provides this function and passes it as a prop to the component. This function
   * should be called with an object that contains the new values of the properties that
   * you want to change. This is typically used inside a Dash callback to update the component's properties.
   *
   * For example, in our component, we call `setProps` with the new state of the `publicKeyState`
   * whenever the wallet is connected or disconnected. This updates the `publicKeyState` property
   * of the component and triggers a Dash callback that listens to this property.
   */
    setProps: (props: {publicKeyState?: string, rpcEndpoint?: string}) => void;
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

/**
 * SolanaWalletMultiButton component.
 *
 * This is a multi-button component for Solana wallets. It allows users to connect
 * to different types of Solana wallets.
 */
// Define the SolanaWalletMultiButton component.
// This is a functional component that takes some props and returns a JSX element.
const SolanaWalletMultiButton: (props: Props) => JSX.Element = (props: Props) => {
    // Destructure the props to extract the id, network, and setProps properties.
    const { id, className, network, rpcEndpoint, setProps } = props;
    
    // Map the network prop to the corresponding network value. 
    // NETWORKS is a predefined mapping of network names to their values.
    const networkValue = NETWORKS[network];

    // Define a callback function to update the public key.
    // This function will be passed to the Context and Content components, and will be called whenever the public key changes.
    const handlePublicKeyUpdate = (publicKey) => {
        
        // Call setProps to update the publicKeyState property of the component.
        // setProps is a function provided by Dash to update the properties of the component.
        // The new value of publicKeyState will be available in Dash callbacks as an Input.
        if (setProps) setProps({ publicKeyState: publicKey, rpcEndpoint });
    };

    // Return a JSX element.
    return (
        // Wrap everything in a div and assign it the id prop.
        // This id will be used to identify the component in Dash callbacks.
        <div id={id} className={className}>
            
            {/* Use the Context component to provide the wallet context to its children.
            Pass the network value and the handlePublicKeyUpdate function as props. */}
            <Context network={networkValue} rpcEndpoint={rpcEndpoint} onPublicKeyUpdate={handlePublicKeyUpdate}>
                
                {/* Use the Content component to display the WalletMultiButton and handle the wallet connection.
                 Pass the handlePublicKeyUpdate function as a prop. */}
                <Content onPublicKeyUpdate={handlePublicKeyUpdate} />
            </Context>
        </div>
    );
};

// Define the default props for the SolanaWalletMultiButton component.
// If no value is provided for these props when the component is used, these default values will be used.
SolanaWalletMultiButton["defaultProps"] = {network: 'mainnet', PublicKeyState: null, rpcEndpoint: null};

// Export the SolanaWalletMultiButton component as the default export of this module.
// This allows the component to be imported using the default import syntax.
export default SolanaWalletMultiButton;

// The Context component is responsible for providing the necessary wallet connections 
// and context to its child components (passed as the `children` prop).
const Context: FC<{ children: ReactNode, network: WalletAdapterNetwork, onPublicKeyUpdate: (publicKey: string | null) => void, rpcEndpoint?: string }> = ({ children, network , onPublicKeyUpdate, rpcEndpoint }) => {
    
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