import cfxify from 'cfx.dom'

CFX = cfxify {
  'div'
  'h1'
}

export default =>

  {
    c_div
    c_h1
  } = CFX

  c_div {}
  ,
    c_h1 {}
    , 'Hello World!!!'
