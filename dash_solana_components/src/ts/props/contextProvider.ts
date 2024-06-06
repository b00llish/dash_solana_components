import { DashBaseProps } from './dash';

export type WalletContextProviderProps = {
    setProps: (props: {}) => void;
} & DashBaseProps;