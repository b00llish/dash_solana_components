import * as React from "react";
import { DashBaseProps } from "./dash";

/**
 * Props for the TransactionButtonWrapper component.
 * @typedef {Object} TransactionButtonWrapperProps
 * @property {React.ReactNode} children - The child components to be rendered inside the wrapper.
 * @property {string[] | []} transactionInstructions - The transaction instructions in JSON format, or an empty list if none.
 */
export type TransactionButtonWrapperProps = {
    /**
     * The child components to be rendered inside the wrapper.
     */
    children: React.ReactNode;

    /**
     * The transaction instructions in JSON format, or an empty list if none.
     */
    transactionInstructions: string[] | [];

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
        transactionSignature?: string;
    }) => void;
} & DashBaseProps;