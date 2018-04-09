import { ddbs as dd } from 'ddeyes'
import cfxify from 'cfx.dom'

import React, { Component } from 'react'
import babylon from './babylon'

CFX = cfxify {
  'canvas'
}

class TestCanvas extends Component

  constructor: (props) ->
    super props
    return

  canvas: null
  engine: null
  scene: null

  canvasRef: (ref) =>
    @canvas = ref
    return

  componentDidMount: =>
    {
      engine
      scene
    } = babylon @canvas

    @engine = engine
    @scene = scene

    @engine.runRenderLoop =>
      @scene.render()

    @

  render: =>

    {
      c_canvas
    } = CFX

    c_canvas {
      @props...
      ref: @canvasRef
    }

export default TestCanvas
