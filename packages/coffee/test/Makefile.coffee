import dd from 'ddeyes'

import { isCSG, isCAG } from '@jscad/csg'
import oscad from '@jscad/csg/api'
import createJscadFunction from '@jscad/core/code-loading/jscad-function'
import { toArray } from '@jscad/core/utils/arrays'
import { mergeSolids } from '@jscad/core/utils/mergeSolids'


source = """
"use strict";

var c;

c = function(func, ...params) {
  return func.apply(this, params);
};

var c$1 = c;

// title      : Example 004
var example004 = () => {
  return c$1(
    difference,
    cube({
      size: 30,
      center: true
    }),
    sphere(20)
  );
};

function main() {
  return example004();
}
"""

include = (x) => x
globals = {
  oscad
}

func = createJscadFunction source
, globals

objects = func {}
, include, globals

objects = (
  toArray objects
)
.map (object) =>
  if ( isCSG object ) or
  ( isCAG object )
    object.toCompactBinary()

# if objects.length is 0
#   throw new Error [
#     'The JSCAD script'
#     'must return one or more'
#     'CSG or CAG solids.'
#   ].join ' '

viewObject = mergeSolids objects.slice 0, 1
