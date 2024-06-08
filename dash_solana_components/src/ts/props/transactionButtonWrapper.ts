// transactionButtonWrapper.ts
import * as React from "react";
import * as web3 from "@solana/web3.js";
import { DashBaseProps } from "./dash";

export type TransactionButtonWrapperProps = {
    children: React.ReactNode;
    transactionInstructions: string[] | [];  // Allowing list of strings or an empty list
    onTransactionSent?: (signature: string) => void;
} & DashBaseProps;