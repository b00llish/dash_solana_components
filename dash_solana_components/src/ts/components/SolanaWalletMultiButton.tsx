/**
 * This file contains a React component for a Solana Wallet Multi Button, which provides
 * an interface to interact with different Solana wallets and return a public key when connected.
 * This component uses the '@solana/wallet-adapter-react' library to handle wallet interactions.
 */

// Import required modules
import React, {useState} from 'react';
import { MultiButtonProps } from '../props/button';
import { NETWORKS } from '../constants';
import WalletContextProvider from './WalletContextProvider';
import { Content } from '../helpers/Content';

// Import required stylesheets  
// require('./SolanaWalletMultiButton.css');
require('@solana/wallet-adapter-react-ui/styles.css');

/**
 * SolanaWalletMultiButton component.
 *
 * This is a multi-button component for Solana wallets. It allows users to connect
 * to different types of Solana wallets.
 */

// Define the SolanaWalletMultiButton component.
// This is a functional component that takes some props and returns a JSX element.
const SolanaWalletMultiButton: (props: MultiButtonProps) => JSX.Element = (props: MultiButtonProps) => {
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
            {/* <WalletContextProvider network={networkValue} rpcEndpoint={rpcEndpoint}> */}
                
                {/* Use the Content component to display the WalletMultiButton and handle the wallet connection.
                 Pass the handlePublicKeyUpdate function as a prop. */}
                <Content onPublicKeyUpdate={handlePublicKeyUpdate} />
            {/* </WalletContextProvider> */}
        </div>
    );
};

// Define the default props for the SolanaWalletMultiButton component.
// If no value is provided for these props when the component is used, these default values will be used.
SolanaWalletMultiButton["defaultProps"] = {network: 'mainnet', PublicKeyState: null, rpcEndpoint: null};

// Export the SolanaWalletMultiButton component as the default export of this module.
// This allows the component to be imported using the default import syntax.
export default SolanaWalletMultiButton;
