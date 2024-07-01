// Content.tsx

import { WalletMultiButton } from "@solana/wallet-adapter-react-ui";
import React, { FC, useEffect } from "react";
import { useWallet } from "@solana/wallet-adapter-react";
import { AdapterButtonProps } from "props/adapterButton";

// The Content component renders the WalletMultiButton and also monitors the connection status
// and public key of the wallet via the `useWallet` hook.

export const Content: FC<{
    onPublicKeyUpdate: (publicKey: string | null) => void;
    buttonProps: AdapterButtonProps;
}> = ({ onPublicKeyUpdate, buttonProps }) => {
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
    return <WalletMultiButton {...buttonProps} />;
};
