import { DashBaseProps } from "./dash";

export type WalletContextProviderProps = {
    /**
     * The network for the wallet.
     *
     * This prop specifies the network for the wallet. It can be 'devnet', 'mainnet', or 'testnet'.
     */
    network: "devnet" | "mainnet" | "testnet";

    /**
     * The custom RPC endpoint for the wallet.
     *
     * This prop specifies a custom RPC endpoint for the wallet. If it's not provided,
     * the default endpoint for the specified network will be used.
     */
    rpcEndpoint?: string;

    /** Content */
    children: React.ReactNode;
} & DashBaseProps;
