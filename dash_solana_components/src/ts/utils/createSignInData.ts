import { SolanaSignInInput } from "@solana/wallet-standard-features";

export const createSignInData = async (): Promise<SolanaSignInInput> => {
    const now: Date = new Date();
    const uri = window.location.href;
    const currentUrl = new URL(uri);
    const domain = currentUrl.host;

    // Convert the Date object to a string
    const currentDateTime = now.toISOString();
    const signInData: SolanaSignInInput = {
        domain,
        statement:
            "Clicking Sign or Approve only means you have proved this wallet is owned by you. This request will not trigger any blockchain transaction or cost any gas fee.",
        issuedAt: currentDateTime,
    };

    return signInData;
};
