import * as React from "react"
import { Frame, useCycle, addPropertyControls, ControlType } from "framer"
import styled from "@emotion/styled"

const ButtonWrapper = styled.button`
    display: inline-block;
    line-height: 1;
    text-transform: none;
    font-weight: 600;
    font-size: 14px;
    color: rgb(47, 41, 54);
    background-color: rgb(255, 255, 255);
    box-shadow: rgba(0, 0, 0, 0.05) 0px 2px;
    cursor: pointer;
    border-radius: 3px;
    padding: 0px;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(216, 210, 222);
    border-image: initial;
    &:hover {
        background: rgb(255, 255, 255);
        border-color: rgb(201, 192, 209);
    }
`

const ButtonLabel = styled.span`
    display: grid;
    grid-auto-flow: column;
    align-items: center;
    justify-content: center;
    padding: 12px 16px;
`

export function Button01(props) {
    return (
        <ButtonWrapper>
            <ButtonLabel>{props.text}</ButtonLabel>
        </ButtonWrapper>
    )
}

Button01.defaultProps = {
    text: "Hello World!",
    width: 100,
    height: 100,
    maxWidth: 150,
    unit: "%",
}

addPropertyControls(Button01, {
    text: { type: ControlType.String, title: "Text" },
})
