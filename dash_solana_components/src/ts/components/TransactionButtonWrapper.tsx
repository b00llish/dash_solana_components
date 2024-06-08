// TransactionButtonWrapper.tsx
import React, { useEffect, useState, useRef } from 'react';
import * as web3 from '@solana/web3.js';
import { useConnection, useWallet } from '@solana/wallet-adapter-react';
import { TransactionButtonWrapperProps } from '../props/transactionButtonWrapper';

type TransactionInstructionData = {
    program_id: number[];
    accounts: { pubkey: number[]; is_signer: boolean; is_writable: boolean }[];
    data: number[];
};

/**
 * A wrapper component for transaction buttons that handles Solana transaction instructions.
 * @param {Object} props - The properties for the component.
 * @param {string} props.id - The ID of the component.
 * @param {string} props.className - The CSS class of the component.
 * @param {function} props.setProps - Function to set properties.
 * @param {React.ReactNode} props.children - The child components.
 * @param {string[] | null} props.transactionInstructions - The transaction instructions in JSON format.
 * @returns {JSX.Element} The rendered component.
 */
const TransactionButtonWrapper = ({
    id,
    className,
    setProps,
    children,
    transactionInstructions,
}: TransactionButtonWrapperProps): JSX.Element => {
    const { connection } = useConnection();
    const { publicKey, sendTransaction } = useWallet();
    const [loading, setLoading] = useState(false);
    const [executed, setExecuted] = useState(false);
    const prevInstructionsRef = useRef<string[] | null>(null);

    useEffect(() => {
        if (
            transactionInstructions === prevInstructionsRef.current ||
            !transactionInstructions ||
            transactionInstructions.length === 0
        ) {
            return;
        }

        const executeTransaction = async () => {
            if (!publicKey || !connection) {
                console.log('Please connect your wallet.');
                return;
            }

            setLoading(true);
            setExecuted(true);
            prevInstructionsRef.current = transactionInstructions; // Update the ref to the current instructions

            try {
                const transaction = new web3.Transaction();

                transactionInstructions.forEach(instrString => {
                    const instr: TransactionInstructionData = JSON.parse(instrString);
                    console.log('parsed instruction: ', instr);

                    const keys = instr.accounts.map(account => {
                        const pubkey = new web3.PublicKey(new Uint8Array(account.pubkey));
                        console.log('Parsed pubkey: ', pubkey.toString());
                        return {
                            pubkey,
                            isSigner: account.is_signer,
                            isWritable: account.is_writable,
                        };
                    });

                    const programId = new web3.PublicKey(new Uint8Array(instr.program_id));
                    console.log('Parsed programId: ', programId.toString());

                    const data = Buffer.from(new Uint8Array(instr.data));
                    console.log('Parsed data: ', data);

                    const newInstruction = new web3.TransactionInstruction({ keys, programId, data });
                    console.log('newInstruction: ', newInstruction);
                    transaction.add(newInstruction);
                });

                const signature = await sendTransaction(transaction, connection);
                console.log('Transaction signature:', signature);

                setProps({ transactionSignature: signature });
            } catch (error) {
                console.error('Transaction failed:', error);
            } finally {
                setLoading(false);
                setExecuted(false);
            }
        };

        executeTransaction();
    }, [transactionInstructions, connection, publicKey, sendTransaction, setProps, executed, setLoading]);

    const handleClick = (event) => {
        event.preventDefault();
        console.log('Button clicked, waiting for transaction instructions...');
    };

    return (
        <div id={id} className={className} onClick={handleClick} style={{ pointerEvents: loading ? 'none' : 'auto' }}>
            {children}
        </div>
    );
};

export default TransactionButtonWrapper;