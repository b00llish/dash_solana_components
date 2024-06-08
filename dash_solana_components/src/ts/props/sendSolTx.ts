import * as web3 from "@solana/web3.js";
import { SendTransactionOptions } from "@solana/wallet-adapter-base";
import { DashBaseProps } from "./dash";

export type SendSolTxProps = {
    /**
     * Transaction signature.
     */
    sendSolTx: string;

    /**
     * Connection element for wallet.
     */
    connection: web3.Connection;
    
    /**
     * Public key element for wallet.
     */
    publicKey: web3.PublicKey | null;

    setSendSolTx: (transaction: string) => void;

    connectionErr: () => boolean | undefined;
    sendTransaction: (
        transaction: web3.Transaction,
        connection: web3.Connection,
        options?: SendTransactionOptions
    ) => Promise<string>;


} & DashBaseProps;
