// const executeSmartTransaction = async () => {
//     if (!publicKey || !connection) {
//         console.log("Please connect your wallet.");
//         return;
//     }

//     setLoading(true);
//     setExecuted(true);
//     prevInstructionsRef.current = transactionInstructions; // Update the ref to the current instructions

//     try {
//         const instructions: web3.TransactionInstruction[] = [];

//         transactionInstructions.forEach((instrString) => {
//             const instr: TransactionInstructionData = JSON.parse(instrString);
//             console.log("parsed instruction: ", instr);

//             const keys = instr.accounts.map((account) => {
//                 const pubkey = new web3.PublicKey(new Uint8Array(account.pubkey));
//                 console.log("Parsed pubkey: ", pubkey.toString());
//                 return {
//                     pubkey,
//                     isSigner: account.is_signer,
//                     isWritable: account.is_writable,
//                 };
//             });

//             const programId = new web3.PublicKey(new Uint8Array(instr.program_id));
//             console.log("Parsed programId: ", programId.toString());

//             const data = Buffer.from(new Uint8Array(instr.data));
//             console.log("Parsed data: ", data);

//             const newInstruction = new web3.TransactionInstruction({
//                 keys,
//                 programId,
//                 data,
//             });
//             console.log("newInstruction: ", newInstruction);

//             instructions.push(newInstruction);

//             // Collect signers (if not already in the signers array)
//             // instr.accounts.forEach((account) => {
//             //     if (account.is_signer && !signers.find(signer => signer.publicKey.equals(pubkey))) {
//             //         signers.push({
//             //             publicKey: pubkey,
//             //         });
//             //     }
//             // });
//         });
//         const testInstructions = [
//             web3.ComputeBudgetProgram.setComputeUnitLimit({ units: 1_400_000 }),
//             ...instructions,
//         ];
        
//         const testTransaction = new web3.VersionedTransaction(
//             new web3.TransactionMessage({
//                 instructions: testInstructions,
//                 payerKey: payer,
//                 recentBlockhash: (await this.connection.getLatestBlockhash()).blockhash,
//             }).compileToV0Message(lookupTables)
//         );
        
//         const rpcResponse = await this.connection.simulateTransaction(testTransaction, {
//             replaceRecentBlockhash: true,
//             sigVerify: false,
//         });
        
//         const unitsConsumed = rpcResponse.value.unitsConsumed;
//         const signature = await helius.rpc.sendSmartTransaction(
//             instructions,
            
//         );
//         console.log("Transaction signature:", signature);

//         setProps({ transactionSignature: signature });
//     } catch (error) {
//         console.error("Transaction failed:", error);
//     } finally {
//         setLoading(false);
//         setExecuted(false);
//     }
// };