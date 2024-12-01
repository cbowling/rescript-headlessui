# rescript-headlessui

[![npm](https://img.shields.io/npm/v/rescript-headless.svg)](https://npmjs.org/rescript-headless)

This library provides [ReScript](https://rescript-lang.org/) bindings for [HeadlessUI](https://headlessui.com/) React components.

## Installation

```sh
npm install rescript-headlessui
```

Add it to `bs-dependencies` in your `rescript.json`:

```json
{
  "bs-dependencies": ["rescript-headlessui"]
}
```

## Usage

### Props

To use `ReactDOM.domProps` in all components, it was necessary to remove collisions. This was achieved by maintaining a custom list of props that excludes most of the fields defined by HeadlessUI. The only exception is for components with event handlers or names resembling event handlers (e.g., `onChange`). Instead of removing these properties globally, they were overridden in the specific modules where they are used. For example, `<Combobox.Input onChange={...} />` should be written as `<Combobox.Input onChangeHeadless={...} />`, with the function defined as `@as("onChange") onChangeHeadless?: ReactEvent.Form.t => unit`. If you need one of the properties listed below, please wrap the component in a native element.

```
{disabled, value, defaultValue, by, multiple, name, form, children, as_, type, checked, defaultChecked, order, role, autoFocus, open_}
```

### Union type bindings

Many of the HeadlessUI bindings allow union types, which can be challenging to represent in ReScript. When the allowed values were well-defined, they were converted into variants:

```rescript
// <Dialog role=#dialog ... />
role?: @string
[
  | #dialog
  | #alertdialog
],

// <Button type#submit ... />
type_?: @string
[
  | #button
  | #submit
  | #reset
],
```

For cases where the allowed values were not explicitly defined, inferred types were used and are configured at compile time:

```rescript
// Common props on every component
type common<'as_> = {
  ...domProps,
  @as("as") as_?: 'as_
}
```

The inferred type is applied wherever "T" appears in the HeadlessUI documentation. This approach works well when used correctly but will result in errors if an unsupported value is provided to HeadlessUI.

#### Attribute `by` exception

An exception was made when defining `by?: ('value, 'value) => bool` instead of `by?: 'by` or `by?: string` to enforce a modicum of type safety.

### Tooltip

There was an undocumented tooltip component in the HeadlessUI package that is also bound here. It is untested and should be used accordingly.

```rescript
module Tooltip = {
  type tooltipProps<'as_> = {
    ...Props.common<'as_>,
    showDelayMs?: int,
    hideDelay?: int,
    children?: React.element,
  }

  @module("@headlessui/react") @react.component(: tooltipProps<'as_>)
  external make: unit => React.element = "Tooltip"

  module Trigger = {
    type triggerState = {
      focus: bool,
      hover: bool,
      autoFocus: bool,
    }
    type triggerProps<'as_> = {
      ...Props.common<'as_>,
      disabled?: bool,
      autoFocus?: bool,
      children?: React.component<triggerState>,
    }

    @module("@headlessui/react") @react.component(: triggerProps<'as_>)
    external make: unit => React.element = "TooltipTrigger"
  }

  module Panel = {
    type panelProps<'as_, 'anchor> = {
      ...Props.common<'as_>,
      anchor?: 'anchor,
      static?: bool,
      unmount?: bool,
      children?: React.element,
    }

    @module("@headlessui/react") @react.component(: panelProps<'as_, 'anchor>)
    external make: unit => React.element = "TooltipPanel"
  }
}
```
