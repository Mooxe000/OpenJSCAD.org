import { storiesOf } from '@storybook/react'
import { Welcome } from '@storybook/react/demo'

import cfxify from 'cfx.dom'
import babylon from './babylon'
import OpenJSCAD from './OpenJSCAD'

CFX = cfxify {
  babylon
  OpenJSCAD
}

export default ->

  storiesOf 'Canvas', module

  .add 'babylon'

  , =>

    { c_babylon } = CFX

    c_babylon
      style:
        width: '100vw'
        height: '100vh'

  .add 'OpenJSCAD'

  , =>

    { c_OpenJSCAD } = CFX

    c_OpenJSCAD {}
