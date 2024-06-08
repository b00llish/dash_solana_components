import { DashBaseProps } from "./dash";

/**
 * Define component properties.
 * The component receives a network prop which can be one of 'devnet', 'mainnet', 'testnet',
 * and a publicKeyState prop which is used to store and provide the public key state.
 */
export type MultiButtonProps = {
    /**
     * The network for the wallet.
     *
     * This prop specifies the network for the wallet. It can be 'devnet', 'mainnet', or 'testnet'.
     */
    network: "devnet" | "mainnet" | "testnet";

    /**
     * The state of the public key.
     *
     * This prop holds the state of the public key. It could be a string representing
     * the public key, or null if there is no public key.
     */
    publicKeyState?: string | null; // <-- Add ? to make this property optional

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
    setProps: (props: {
        publicKeyState?: string;
        rpcEndpoint?: string;
    }) => void;
} & DashBaseProps;
