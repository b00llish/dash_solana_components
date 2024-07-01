// adapterButton.tsx

// this file is intended to mirror the button props in the wallet adapter library
// node_modules/@solana/wallet-adapter-react-ui/src/Button.tsx

import type {
    CSSProperties,
    MouseEvent,
    PropsWithChildren,
    ReactElement,
} from "react";

export type AdapterButtonProps = PropsWithChildren<{
    className?: string;
    disabled?: boolean;
    endIcon?: ReactElement;
    onClick?: (e: MouseEvent<HTMLButtonElement>) => void;
    startIcon?: ReactElement;
    style?: CSSProperties;
    tabIndex?: number;
}>;
