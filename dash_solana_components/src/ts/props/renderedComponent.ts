import * as React from "react";
import * as web3 from "@solana/web3.js";

type OutputItem = {
    title: string;
    dependency: web3.PublicKey | string;
    href: string;
};

type InputItem = {
    title: string;
    id: string;
    type: string;
    method: (event: React.ChangeEvent<HTMLInputElement>) => void;
    placeholder?: string;
    value?: string;
    className?: string;
    min?: number;
    step?: number;
};

export type RenderedComponentProps = {
    title: string;
    buttonText: string;

    method: (event: React.FormEvent<HTMLFormElement>) => void;
    validation: web3.PublicKey | undefined | null;
    inputs: InputItem[];
    outputs: OutputItem[];
};