import * as React from "react"
import { Frame, useCycle, addPropertyControls, ControlType } from "framer"
import styled from "@emotion/styled"

// Button Default Styles
const ButtonWrapper = styled.button`
  display: inline-block;
  line-height: 1;
  text-transform: none;
  font-weight: 600;
  border-radius: 3px;
  padding: 0px;
  border-width: 1px;
  border-style: solid;
  cursor: pointer;
  box-shadow: rgba(0, 0, 0, 0.05) 0px 2px;
  display: grid;
  grid-auto-flow: column;
  align-items: center;
  justify-content: center;
  padding: 14px 20px;
  ${props =>
      props.primary &&
      `
        font-size: 16px;
        color: rgb(255, 255, 255);
        background-color: rgb(108, 95, 199);
        border-color: rgb(61, 50, 142);
        &:hover {
          background: rgb(78, 63, 180);
          border-color: rgb(53, 43, 123);
        }
  `}
  ${props =>
      props.secondary &&
      `
        font-size: 14px; 
        color: rgb(47, 41, 54);
        background-color: rgb(255, 255, 255);
        border-color: rgb(216, 210, 222);
        &:hover {
            background: rgb(255, 255, 255);
            border-color: rgb(201, 192, 209);
        }
  `}
`

export function Button(props) {
    function determineButtonKind(props) {
        if (props.buttonType == "primary") {
            return `primary`
        }
        if (props.buttonType == "secondary") {
            return `secondary`
        }
    }

    return <ButtonWrapper {props.determineButtonKind}>{props.text}</ButtonWrapper>
}

// Component Default Props
Button.defaultProps = {
    text: "Button String Needed",
    width: 202,
    height: 50,
    unit: "px",
}

// Adding UI propety Controls
addPropertyControls(Button, {
    text: { type: ControlType.String, title: "Text" },
    buttonType: {
        type: ControlType.Enum,
        defaultValue: "primary",
        options: ["primary", "secondary"],
        optionTitles: ["Primary", "Secondary"],
    },
})

// export function Button(props) {
//     if (props.buttonType == "primary") {
//         return <ButtonWrapper primary>{props.text}</ButtonWrapper>
//     }
// }

// // Component Default Props
// Button.defaultProps = {
//     text: "Button String Needed",
//     width: 202,
//     height: 50,
//     unit: "px",
// }

// // Adding UI propety Controls
// addPropertyControls(Button, {
//     text: { type: ControlType.String, title: "Text" },
//     buttonType: {
//         type: ControlType.Enum,
//         defaultValue: "primary",
//         options: ["primary", "secondary"],
//         optionTitles: ["Primary", "Secondary"],
//     },
// })

// export function Button(props) {
//     if (props.buttonType == "primary") {
//         return <ButtonWrapper primary>{props.text}</ButtonWrapper>
//     }
//     if (props.buttonType == "secondary") {
//         return <ButtonWrapper secondary>{props.text}</ButtonWrapper>
//     }
// }
