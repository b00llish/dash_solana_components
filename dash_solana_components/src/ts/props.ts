/**
 * Every Dash components are given these props.
 * Use with your own props:
 * ```
 * type Props = {
 *     my_prop: string;
 * } & DashComponentProps;
 * ```
 * Recommended to use `type` instead of `interface` so you can define the
 * order of props with types concatenation.
 */
export type DashComponentProps = {
    /**
     * Unique ID to identify this component in Dash callbacks.
     */
    id?: string;
    /**
     * CSS class name(s)
     *
     * This prop can be used to apply one or more CSS classes to the button.
     * This makes it easy to customize the appearance of the button using CSS.
     */
    className?: string;
    /**
     * Update props to trigger callbacks.
     */
    setProps: (props: Record<string, any>) => void;
}
