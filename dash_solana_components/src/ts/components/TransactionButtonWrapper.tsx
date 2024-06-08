import React, { useEffect, useState } from 'react';
import * as web3 from '@solana/web3.js';
import { useConnection, useWallet } from '@solana/wallet-adapter-react';
import { TransactionButtonWrapperProps } from '../props/transactionButtonWrapper';

type TransactionInstructionData = {
    program_id: number[];
    accounts: { pubkey: number[]; is_signer: boolean; is_writable: boolean }[];
    data: number[];
};

const TransactionButtonWrapper = ({
    id,
    className,
    setProps,
    children,
    transactionInstructions,
    onTransactionSent,
}: TransactionButtonWrapperProps) => {
    const { connection } = useConnection();
    const { publicKey, sendTransaction } = useWallet();
    const [loading, setLoading] = useState(false);
    const [executed, setExecuted] = useState(false);  // Flag to prevent multiple executions

    useEffect(() => {
        const executeTransaction = async () => {
            if (!publicKey || !connection) {
                console.log('Please connect your wallet.');
                return;
            }

            if (!transactionInstructions || transactionInstructions.length === 0) {
                console.log('No instructions provided');
                return;
            }

            if (executed) {
                console.log('Transaction already executed');
                return;
            }

            setLoading(true);
            setExecuted(true);  // Set the flag to prevent further executions

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

                if (onTransactionSent) {
                    onTransactionSent(signature);
                }

                setProps({ transactionSignature: signature });
            } catch (error) {
                console.error('Transaction failed:', error);
            } finally {
                setLoading(false);
            }
        };

        executeTransaction();
    }, [transactionInstructions, connection, publicKey, sendTransaction, setProps, onTransactionSent, executed]);

    const handleClick = () => {
        console.log('Button clicked, waiting for transaction instructions...');
    };

    return (
        <div id={id} className={className} onClick={handleClick} style={{ pointerEvents: loading ? 'none' : 'auto' }}>
            {children}
        </div>
    );
};

export default TransactionButtonWrapper;