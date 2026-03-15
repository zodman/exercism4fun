type
  ComputeFunc = proc(vals: seq[int]): int {.noSideEffect.}

  Callback = proc(val: int)

  Cell = ref object
    value: int

proc newInputCell*(val: int): Cell =
  var c = Cell(value: val)
  return c

proc value*(cell: Cell): int =
  return cell.value
#
proc `value=`*(cell: Cell, val: int) =
  cell.value = val
   

proc newComputeCell*(dependencies: seq[Cell], compute: ComputeFunc): Cell =
  var listValues: seq[int] = @[]
  for i in dependencies:
    listValues.add(i.value)
  var newResult = compute(listValues)
  return Cell(value: newResult)
  

proc addCallback*(cell: Cell, callback: Callback) =
  discard

proc removeCallback*(cell: Cell, callback: Callback) =
  discard
