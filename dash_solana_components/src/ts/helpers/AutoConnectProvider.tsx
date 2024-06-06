// Import the useLocalStorage hook from the @solana/wallet-adapter-react package.
// This hook allows you to store and retrieve data from the browser's local storage.
import { useLocalStorage } from "@solana/wallet-adapter-react";

// Import the FC (Function Component) and ReactNode types from React.
// FC is a type that represents a functional component in React.
// ReactNode is a type that represents any valid React child (elements, strings, etc.).
import type { FC, ReactNode } from "react";

// Import React and necessary hooks for creating context and using context.
import React, { createContext, useContext } from "react";

// Define an interface to represent the state of the AutoConnectContext.
// autoConnect: boolean - A boolean value indicating whether auto-connect is enabled.
// setAutoConnect: (autoConnect: boolean) => void - A function to update the autoConnect state.
export interface AutoConnectContextState {
    autoConnect: boolean;
    setAutoConnect(autoConnect: boolean): void;
}

// Create a context with a default value of an empty object cast to AutoConnectContextState.
// This context will be used to share the auto-connect state across the application.
export const AutoConnectContext = createContext<AutoConnectContextState>(
    {} as AutoConnectContextState
);

// Custom hook to use the AutoConnectContext. This simplifies access to the context in components.
export function useAutoConnect(): AutoConnectContextState {
    return useContext(AutoConnectContext);
}

// Define the AutoConnectProvider component, which is a functional component (FC) that takes children as props.
// This provider component will wrap the parts of the application that need access to the auto-connect state.
export const AutoConnectProvider: FC<{ children: ReactNode }> = ({
    children,
}) => {
    // Use the useLocalStorage hook to manage the autoConnect state.
    // The key 'autoConnect' is used to store the value in local storage, and true is the default value.
    const [autoConnect, setAutoConnect] = useLocalStorage("autoConnect", true);

    // The provider component returns the AutoConnectContext.Provider component with the current value of autoConnect and setAutoConnect.
    // This allows any child component to access and modify the autoConnect state via the context.
    return (
        <AutoConnectContext.Provider value={{ autoConnect, setAutoConnect }}>
            {children}
        </AutoConnectContext.Provider>
    );
};
