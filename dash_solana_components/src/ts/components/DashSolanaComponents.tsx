import React from 'react';
import {DashComponentProps} from '../props';

type Props = {
    // Insert props
} & DashComponentProps;

/**
 * Component description
 */
const DashSolanaComponents = (props: Props) => {
    const { id } = props;
    return (
        <div id={id}>
            {/* Insert code */}
        </div>
    )
}

DashSolanaComponents.defaultProps = {};

export default DashSolanaComponents;
