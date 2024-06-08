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
} & DashBaseProps;