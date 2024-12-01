@@ocaml.doc("
 ** External bindings to HeadlessUI components
 ** https://headlessui.com
 ")

module Button = {
  type buttonState = {
    disabled: bool,
    focus: bool,
    hover: bool,
    active: bool,
    autoFocus: bool,
  }
  type buttonProps<'as_> = {
    ...Props.common<'as_>,
    disabled?: bool,
    autoFocus?: bool,
    @as("type")
    type_?: @string
    [
      | #button
      | #submit
      | #reset
    ],
    children?: React.component<buttonState>,
  }

  @module("@headlessui/react") @react.component(: buttonProps<'as_>)
  external make: unit => React.element = "Button"
}

module Checkbox = {
  type checkboxState = {
    checked: bool,
    indeterminate: bool,
    disabled: bool,
    focus: bool,
    hover: bool,
    active: bool,
    changing: bool,
  }
  type checkboxProps<'as_, 'value> = {
    ...Props.common<'as_>,
    checked?: bool,
    defaultChecked?: 'value,
    @as("onChange") onChangeHeadless?: 'value => unit,
    indeterminate?: bool,
    disabled?: bool,
    autoFocus?: bool,
    name?: string,
    form?: string,
    value?: string,
    children?: React.component<checkboxState>,
  }

  @module("@headlessui/react") @react.component(: checkboxProps<'as_, 'value>)
  external make: unit => React.element = "Checkbox"
}

module CloseButton = {
  type closeButtonProps<'as_> = {
    ...Props.common<'as_>,
    children?: React.element,
  }

  @module("@headlessui/react") @react.component(: closeButtonProps<'as_>)
  external make: unit => React.element = "CloseButton"
}

module Combobox = {
  type comboboxState<'value> = {
    value: 'value,
    @as("open") open_: bool,
    activeOption: option<'value>,
    disabled: bool,
    activeIndex: option<int>,
  }
  type comboboxProps<'as_, 'value> = {
    ...Props.common<'as_>,
    disabled?: bool,
    value?: 'value,
    defaultValue?: 'value,
    by?: ('value, 'value) => bool,
    @as("onChange") onChangeHeadless?: 'value => unit,
    @as("onClose") onCloseHeadless?: unit => unit,
    multiple?: bool,
    name?: string,
    form?: string,
    immediate?: bool,
    virtual?: {"options": array<'value>, "disabled": 'value => bool},
    children?: React.component<comboboxState<'value>>,
  }

  @module("@headlessui/react") @react.component(: comboboxProps<'as_, 'value>)
  external make: unit => React.element = "Combobox"

  module Input = {
    type inputState = {
      @as("open") open_: bool,
      disabled: bool,
      focus: bool,
      hover: bool,
      autoFocus: bool,
    }
    type inputProps<'as_, 'value> = {
      ...Props.common<'as_>,
      displayValue?: 'value => string,
      @as("onChange") onChangeHeadless?: ReactEvent.Form.t => unit,
      autoFocus?: bool,
      children?: React.component<inputState>,
    }

    @module("@headlessui/react") @react.component(: inputProps<'as_, 'value>)
    external make: unit => React.element = "ComboboxInput"
  }

  module Button = {
    type buttonState<'value> = {
      value: 'value,
      @as("open") open_: bool,
      disabled: bool,
      focus: bool,
      hover: bool,
      active: bool,
    }
    type buttonProps<'as_, 'value> = {
      ...Props.common<'as_>,
      autoFocus?: bool,
      children?: React.component<buttonState<'value>>,
    }

    @module("@headlessui/react") @react.component(: buttonProps<'as_, 'value>)
    external make: unit => React.element = "ComboboxButton"
  }

  module Options = {
    type optionsState = {@as("open") open_: bool}
    type optionsProps<'as_, 'anchor> = {
      ...Props.common<'as_>,
      transition?: bool,
      anchor?: 'anchor,
      static?: bool,
      unmount?: bool,
      portal?: bool,
      modal?: bool,
      children?: React.component<optionsState>,
    }

    @module("@headlessui/react") @react.component(: optionsProps<'as_, 'anchor>)
    external make: unit => React.element = "ComboboxOptions"
  }

  module Option = {
    type optionState = {
      selected: bool,
      disabled: bool,
      focus: bool,
    }
    type optionProps<'as_, 'value> = {
      ...Props.domProps,
      @as("as") as_?: 'as_,
      value?: 'value,
      disabled?: bool,
      order?: int,
      children?: React.component<optionState>,
    }

    @module("@headlessui/react") @react.component(: optionProps<'as_, 'value>)
    external make: unit => React.element = "ComboboxOption"
  }
}

module Description = {
  type descriptionState = {@as("open") open_: bool}
  type descriptionProps<'as_> = {
    ...Props.common<'as_>,
    children?: React.component<descriptionState>,
  }

  @module("@headlessui/react") @react.component(: descriptionProps<'as_>)
  external make: unit => React.element = "Description"
}

module Dialog = {
  type dialogState = {@as("open") open_: bool}
  type dialogProps<'as_> = {
    ...Props.common<'as_>,
    @as("open") open_?: bool,
    onClose?: bool => unit,
    autoFocus?: bool,
    transition?: bool,
    static?: bool,
    unmount?: bool,
    role?: @string
    [
      | #dialog
      | #alertdialog
    ],
    children?: React.component<dialogState>,
  }

  @module("@headlessui/react") @react.component(: dialogProps<'as_>)
  external make: unit => React.element = "Dialog"

  module Backdrop = {
    type backdropState = {@as("open") open_: bool}
    type backdropProps<'as_> = {
      ...Props.common<'as_>,
      transition?: bool,
      children?: React.component<backdropState>,
    }

    @module("@headlessui/react") @react.component(: backdropProps<'as_>)
    external make: unit => React.element = "DialogBackdrop"
  }

  module Panel = {
    type panelState = {@as("open") open_: bool}
    type panelProps<'as_> = {
      ...Props.common<'as_>,
      transition?: bool,
      children?: React.component<panelState>,
    }

    @module("@headlessui/react") @react.component(: panelProps<'as_>)
    external make: unit => React.element = "DialogPanel"
  }

  module Title = {
    type titleState = {@as("open") open_: bool}
    type titleProps<'as_> = {
      ...Props.common<'as_>,
      children?: React.component<titleState>,
    }

    @module("@headlessui/react") @react.component(: titleProps<'as_>)
    external make: unit => React.element = "DialogTitle"
  }
}

module Disclosure = {
  type disclosureState = {
    @as("open") open_: bool,
    close: option<React.ref<Nullable.t<Webapi.Dom.Element.t>>> => unit,
  }
  type disclosureProps<'as_> = {
    ...Props.common<'as_>,
    defaultOpen?: bool,
    children?: React.component<disclosureState>,
  }

  @module("@headlessui/react") @react.component(: disclosureProps<'as_>)
  external make: unit => React.element = "Disclosure"

  module Button = {
    type buttonState = {
      @as("open") open_: bool,
      focus: bool,
      hover: bool,
      active: bool,
      autoFocus: bool,
    }
    type buttonProps<'as_> = {
      ...Props.common<'as_>,
      autoFocus?: bool,
      children?: React.component<buttonState>,
    }

    @module("@headlessui/react") @react.component(: buttonProps<'as_>)
    external make: unit => React.element = "DisclosureButton"
  }

  module Panel = {
    type panelState = {
      @as("open") open_: bool,
      close: option<React.ref<Nullable.t<Webapi.Dom.Element.t>>> => unit,
    }
    type panelProps<'as_> = {
      ...Props.common<'as_>,
      transition?: bool,
      static?: bool,
      unmount?: bool,
      children?: React.component<panelState>,
    }

    @module("@headlessui/react") @react.component(: panelProps<'as_>)
    external make: unit => React.element = "DisclosurePanel"
  }
}

module Field = {
  type fieldState = {disabled: bool}
  type fieldProps<'as_> = {
    ...Props.common<'as_>,
    disabled?: bool,
    children?: React.component<fieldState>,
  }

  @module("headlessui/react") @react.component(: fieldProps<'as_>)
  external make: unit => React.element = "Field"
}

module Fieldset = {
  type fieldsetState = {disabled: bool}
  type fieldsetProps<'as_> = {
    ...Props.common<'as_>,
    disabled?: bool,
    children?: React.component<fieldsetState>,
  }

  @module("@headlessui/react") @react.component(: fieldsetProps<'as_>)
  external make: unit => React.element = "Fieldset"
}

module Input = {
  type inputState = {
    invalid: bool,
    disabled: bool,
    focus: bool,
    hover: bool,
    autoFocus: bool,
  }
  type inputProps<'as_> = {
    ...Props.common<'as_>,
    invalid?: bool,
    disabled?: bool,
    autoFocus?: bool,
    children?: React.component<inputState>,
  }

  @module("@headlessui/react") @react.component(: inputProps<'as_>)
  external make: unit => React.element = "Input"
}

module Label = {
  type labelState = {disabled: bool}
  type labelProps<'as_> = {
    ...Props.common<'as_>,
    passive?: bool,
    children?: React.component<labelState>,
  }

  @module("@headlessui/react") @react.component(: labelProps<'as_>)
  external make: unit => React.element = "Label"
}

module Legend = {
  type legendState = {disabled: bool}
  type legendProps<'as_> = {
    ...Props.common<'as_>,
    children?: React.component<legendState>,
  }

  @module("@headlessui/react") @react.component(: legendProps<'as_>)
  external make: unit => React.element = "Legend"
}

module Listbox = {
  type listboxState<'value> = {
    value: 'value,
    @as("open") open_: bool,
    invalid: bool,
    disabled: bool,
  }
  type listboxProps<'as_, 'value> = {
    ...Props.common<'as_>,
    invalid?: bool,
    disabled?: bool,
    value?: 'value,
    defaultValue?: 'value,
    by?: ('value, 'value) => bool,
    @as("onChange") onChangeHeadless?: 'value => unit,
    horizontal?: bool,
    multiple?: bool,
    name?: string,
    form?: string,
    children?: React.component<listboxState<'value>>,
  }

  @module("@headlessui/react") @react.component(: listboxProps<'as_, 'value>)
  external make: unit => React.element = "Listbox"

  module Button = {
    type buttonState<'value> = {
      value: 'value,
      @as("open") open_: bool,
      invalid: bool,
      disabled: bool,
      focus: bool,
      hover: bool,
      active: bool,
      autoFocus: bool,
    }
    type buttonProps<'as_, 'value> = {
      ...Props.common<'as_>,
      children: React.component<buttonState<'value>>,
    }

    @module("@headlessui/react") @react.component(: buttonProps<'as_, 'value>)
    external make: unit => React.element = "ListboxButton"
  }

  module SelectedOption = {
    type selectOptionProps<'as_> = {
      ...Props.common<'as_>,
      placeholder?: React.element,
      options?: array<React.element>,
      children?: React.element,
    }

    @module("@headlessui/react") @react.component(: selectOptionProps<'as_>)
    external make: unit => React.element = "ListboxSelectedOption"
  }

  module Options = {
    type optionsState = {@as("open") open_: bool}
    type optionsProps<'as_, 'anchor> = {
      ...Props.common<'as_>,
      transition?: bool,
      anchor?: 'anchor,
      static?: bool,
      unmount?: bool,
      portal?: bool,
      modal?: bool,
      children?: React.component<optionsState>,
    }

    @module("@headlessui/react") @react.component(: optionsProps<'as_, 'anchor>)
    external make: unit => React.element = "ListboxOptions"
  }

  module Option = {
    type optionState = {
      selected: bool,
      disabled: bool,
      focus: bool,
      selectedOption: bool,
    }
    type optionProps<'as_, 'value> = {
      ...Props.common<'as_>,
      value?: 'value,
      disabled?: bool,
      children?: React.component<optionState>,
    }

    @module("@headlessui/react") @react.component(: optionProps<'as_, 'value>)
    external make: unit => React.element = "ListboxOption"
  }
}

module Menu = {
  type menuState = {@as("open") open_: bool, close: unit => unit}
  type menuProps<'as_> = {
    ...Props.common<'as_>,
    children?: React.component<menuState>,
  }

  @module("@headlessui/react") @react.component(: menuProps<'as_>)
  external make: unit => React.element = "Menu"

  module Button = {
    type buttonState = {
      @as("open") open_: bool,
      focus: bool,
      hover: bool,
      active: bool,
      autoFocus: bool,
    }
    type buttonProps<'as_> = {
      ...Props.common<'as_>,
      disabled?: bool,
      children: React.component<buttonState>,
    }

    @module("@headlessui/react") @react.component(: buttonProps<'as_>)
    external make: unit => React.element = "MenuButton"
  }

  module Items = {
    type itemsState = {@as("open") open_: bool}
    type itemsProps<'as_, 'anchor> = {
      ...Props.common<'as_>,
      transition?: bool,
      anchor?: 'anchor,
      static?: bool,
      unmount?: bool,
      portal?: bool,
      modal?: bool,
      children?: React.component<itemsState>,
    }

    @module("@headlessui/react") @react.component(: itemsProps<'as_, 'anchor>)
    external make: unit => React.element = "MenuItems"
  }

  module Item = {
    type itemState = {
      disabled: bool,
      focus: bool,
      close: unit => unit,
    }
    type itemProps<'as_> = {
      ...Props.common<'as_>,
      disabled?: bool,
      children?: React.component<itemState>,
    }

    @module("@headlessui/react") @react.component(: itemProps<'as_>)
    external make: unit => React.element = "MenuItem"
  }

  module Section = {
    type sectionProps<'as_> = {
      ...Props.common<'as_>,
      children?: React.element,
    }

    @module("@headlessui/react") @react.component(: sectionProps<'as_>)
    external make: unit => React.element = "MenuSection"
  }

  module Heading = {
    type headingProps<'as_> = {
      ...Props.common<'as_>,
      children?: React.element,
    }

    @module("@headlessui/react") @react.component(: headingProps<'as_>)
    external make: unit => React.element = "MenuHeading"
  }

  module Separator = {
    type separatorProps<'as_> = {
      ...Props.common<'as_>,
      children?: React.element,
    }

    @module("@headlessui/react") @react.component(: separatorProps<'as_>)
    external make: unit => React.element = "MenuSeparator"
  }
}

module Popover = {
  type popoverState = {
    @as("open") open_: bool,
    close: option<React.ref<Nullable.t<Webapi.Dom.Element.t>>> => unit,
  }
  type popoverProps<'as_> = {
    ...Props.common<'as_>,
    children?: React.component<popoverState>,
  }

  @module("@headlessui/react") @react.component(: popoverProps<'as_>)
  external make: unit => React.element = "Popover"

  module Backdrop = {
    type backdropState = {@as("open") open_: bool}

    type backdropProps<'as_> = {
      ...Props.common<'as_>,
      transition?: bool,
      children?: React.component<backdropState>,
    }

    @module("@headlessui/react") @react.component(: backdropProps<'as_>)
    external make: unit => React.element = "PopoverBackdrop"
  }

  module Button = {
    type buttonState = {
      @as("open") open_: bool,
      focus: bool,
      hover: bool,
      active: bool,
      autoFocus: bool,
    }
    type buttonProps<'as_> = {
      ...Props.common<'as_>,
      disabled?: bool,
      autoFocus?: bool,
      children?: React.component<buttonState>,
    }

    @module("@headlessui/react") @react.component(: buttonProps<'as_>)
    external make: unit => React.element = "PopoverButton"
  }

  module Panel = {
    type panelState = {
      @as("open") open_: bool,
      close: unit => unit,
    }
    type panelProps<'as_, 'anchor> = {
      ...Props.common<'as_>,
      transition?: bool,
      anchor?: 'anchor,
      static?: bool,
      unmount?: bool,
      portal?: bool,
      modal?: bool,
      focus?: bool,
      children?: React.component<panelState>,
    }

    @module("@headlessui/react") @react.component(: panelProps<'as_, 'anchor>)
    external make: unit => React.element = "PopoverPanel"
  }

  module Group = {
    type groupProps<'as_> = {
      ...Props.common<'as_>,
      children?: React.element,
    }

    @module("@headlessui/react") @react.component(: groupProps<'as_>)
    external make: unit => React.element = "PopoverGroup"
  }
}

module RadioGroup = {
  type radioGroupProps<'as_, 'value> = {
    ...Props.common<'as_>,
    value?: 'value,
    defaultValue?: 'value,
    by?: ('value, 'value) => bool,
    @as("onChange") onChangeHeadless?: 'value => bool,
    disabled?: bool,
    name?: string,
    form?: string,
    children?: React.element,
  }

  @module("@headlessui/react") @react.component(: radioGroupProps<'as_, 'value>)
  external make: unit => React.element = "RadioGroup"

  module Radio = {
    type radioState = {
      checked: bool,
      disabled: bool,
      focus: bool,
      hover: bool,
      autoFocus: bool,
    }
    type radioProps<'as_, 'value> = {
      ...Props.common<'as_>,
      value?: 'value,
      disabled?: bool,
      autoFocus?: bool,
      children?: React.component<radioState>,
    }

    @module("@headlessui/react") @react.component(: radioProps<'as_, 'value>)
    external make: unit => React.element = "Radio"
  }

  module Label = {
    type labelProps<'as_> = {
      ...Props.common<'as_>,
      children?: React.element,
    }

    @module("@headlessui/react") @react.component(: labelProps<'as_>)
    external make: unit => React.element = "RadioGroupLabel"
  }

  module Description = {
    type descriptionProps<'as_> = {
      ...Props.common<'as_>,
      children?: React.element,
    }

    @module("@headlessui/react") @react.component(: descriptionProps<'as_>)
    external make: unit => React.element = "RadioGroupDescription"
  }
}

module Select = {
  type selectState = {
    invalid: bool,
    disabled: bool,
    focus: bool,
    hover: bool,
    autoFocus: bool,
  }
  type selectProps<'as_> = {
    ...Props.common<'as_>,
    invalid?: bool,
    disabled?: bool,
    autoFocus?: bool,
    children?: React.component<selectState>,
  }

  @module("@headlessui/react") @react.component(: selectProps<'as_>)
  external make: unit => React.element = "Select"
}

module Switch = {
  type switchState = {
    checked: bool,
    disabled: bool,
    focus: bool,
    hover: bool,
    active: bool,
    autoFocus: bool,
    changing: bool,
  }
  type switchProps<'as_, 'value> = {
    ...Props.common<'as_>,
    checked?: bool,
    defaultChecked?: 'value,
    @as("onChange") onChangeHeadless?: bool => unit,
    name?: string,
    form?: string,
    value?: string,
    children?: React.component<switchState>,
  }

  @module("@headlessui/react") @react.component(: switchProps<'as_, 'value>)
  external make: unit => React.element = "Switch"
}

module TabGroup = {
  type groupState = {selectedIndex: int}
  type groupProps<'as_> = {
    ...Props.common<'as_>,
    defaultIndex?: int,
    selectedIndex?: int,
    @as("onChange") onChangeHeadless?: int => unit,
    vertical?: bool,
    manual?: bool,
    children?: React.component<groupState>,
  }

  @module("@headlessui/react") @react.component(: groupProps<'as_>)
  external make: unit => React.element = "TabGroup"

  module List = {
    type listState = {selectedIndex: int}

    type listProps<'as_> = {
      ...Props.common<'as_>,
      children?: React.component<listState>,
    }

    @module("@headlessui/react") @react.component(: listProps<'as_>)
    external make: unit => React.element = "TabList"
  }

  module Tab = {
    type tabState = {
      selected: bool,
      focus: bool,
      hover: bool,
      active: bool,
      autoFocus: bool,
    }
    type tabProps<'as_> = {
      ...Props.common<'as_>,
      disabled?: bool,
      autoFocus?: bool,
      children?: React.component<tabState>,
    }

    @module("@headlessui/react") @react.component(: tabProps<'as_>)
    external make: unit => React.element = "Tab"
  }

  module TabPanels = {
    type panelsState = {selectedIndex: int}

    type panelsProps<'as_> = {
      ...Props.common<'as_>,
      children?: React.component<panelsState>,
    }

    @module("@headlessui/react") @react.component(: panelsProps<'as_>)
    external make: unit => React.element = "TabPanels"
  }

  module TabPanel = {
    type panelState = {selected: int}
    type panelProps<'as_> = {
      ...Props.common<'as_>,
      static?: bool,
      unmount?: bool,
      children?: React.component<panelState>,
    }

    @module("@headlessui/react") @react.component(: panelProps<'as_>)
    external make: unit => React.element = "TabPanel"
  }
}

module Textarea = {
  type textareaState = {
    invalid: bool,
    disabled: bool,
    focus: bool,
    hover: bool,
    autoFocus: bool,
  }
  type textareaProps<'as_> = {
    ...Props.common<'as_>,
    invalid?: bool,
    disabled?: bool,
    autoFocus?: bool,
    children?: React.component<textareaState>,
  }

  @module("@headlessui/react") @react.component(: textareaProps<'as_>)
  external make: unit => React.element = "Textarea"
}

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

module Transition = {
  type transitionProps<'as_> = {
    ...Props.common<'as_>,
    show?: bool,
    appear?: bool,
    unmount?: bool,
    beforeEnter?: unit => unit,
    afterEnter?: unit => unit,
    beforeLeave?: unit => unit,
    afterLeave?: unit => unit,
    children?: React.element,
  }

  @module("@headlessui/react") @react.component(: transitionProps<'as_>)
  external make: unit => React.element = "Transition"

  module Child = {
    type transitionChildProps<'as_> = {
      ...Props.common<'as_>,
      appear?: bool,
      unmount?: bool,
      beforeEnter?: unit => unit,
      afterEnter?: unit => unit,
      beforeLeave?: unit => unit,
      afterLeave?: unit => unit,
      children?: React.element,
    }

    @module("@headlessui/react") @react.component(: transitionChildProps<'as_>)
    external make: unit => React.element = "TransitionChild"
  }
}
