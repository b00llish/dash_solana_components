import React, { useState } from "react";
import * as web3 from "@solana/web3.js";
import { useConnection, useWallet } from "@solana/wallet-adapter-react";
import { SendSolTxProps } from "../props/sendSolTx";
import RenderedComponent from "./RenderedComponent";

/**
 * SendSolTx component for sending Solana tokens.
 *
 * @param {SendSolTxProps} props - The properties for the component.
 * @returns {JSX.Element} The rendered component.
 */
const SendSolTx = (props: SendSolTxProps) => {
    const [account, setAccount] = useState("");
    const [amount, setAmount] = useState(0);

    const { connection } = useConnection();
    const { publicKey, sendTransaction } = useWallet();

    /**
     * Handles the submission of the transaction form.
     *
     * @param {React.FormEvent<HTMLFormElement>} event - The form submission event.
     */
    const sendSolTx = async (event: React.FormEvent<HTMLFormElement>) => {
        event.preventDefault();
        if (props.connectionErr()) {
            return;
        }

        console.log("account: ", account);
        console.log("amount: ", amount);

        if (!connection || !publicKey) {
            console.log("Please connect your wallet.");
            return;
        }

        const transaction = new web3.Transaction();
        const instruction = web3.SystemProgram.transfer({
            fromPubkey: publicKey,
            lamports: amount * web3.LAMPORTS_PER_SOL,
            toPubkey: new web3.PublicKey(account),
        });

        transaction.add(instruction);

        console.log("transaction (pre-send)", transaction);

        try {
            const signature = await sendTransaction(transaction, connection);
            props.setSendSolTx(signature);

            console.log("transaction (post-send)", transaction);
        } catch (error) {
            console.log(error);
        } finally {
            console.log("clearing state variables...");
            setAccount("");
            setAmount(0);
            (document.getElementById("account") as HTMLInputElement).value = "";
            (document.getElementById("amount") as HTMLInputElement).value = "";
        }
    };

    const outputs = [
        {
            title: "Transaction Signature...",
            dependency: props.sendSolTx,
            href: `https://solana.fm/tx/${props.sendSolTx}`,
        },
    ];

    const inputs = [
        {
            title: "Address of receiver",
            id: "account",
            type: "text",
            placeholder: "Public key of receiver",
            method: (event: React.ChangeEvent<HTMLInputElement>) => {
                setAccount(event.target.value);
            },
        },
        {
            title: "Amount of SOL to send",
            id: "amount",
            type: "number",
            placeholder: "Amount of SOL to send",
            method: (event: React.ChangeEvent<HTMLInputElement>) => {
                setAmount(event.target.valueAsNumber);
            },
            min: 0,
            step: web3.LAMPORTS_PER_SOL,
        },
    ];

    return (
        <RenderedComponent
            title="Send Sol 💸"
            buttonText="Send Sol"
            method={sendSolTx}
            validation={null}
            outputs={outputs}
            inputs={inputs}
        />
    );
};

export default SendSolTx;
