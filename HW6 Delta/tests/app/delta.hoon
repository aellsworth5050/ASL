::  Demonstrate unit testing on a Gall agent with %delta.
::
/+  *test
/=  agent  /app/delta
|%
::  Build an example bowl manually.
::
++  bowl
  |=  run=@ud
  ^-  bowl:gall
  :*  [~zod ~zod %delta]     :: (our src dap)
      [~ ~]                     :: (wex sup)
      [run `@uvJ`(shax run) *time [~zod %delta ud+run]]
                                :: (act eny now byk)
  ==
::  Build a reference state mold.
::
+$  state
  $:  %0
      watchers=(set @p)
      status=?(%work %break)
  ==
--
|%
::  Test adding a watcher to the list.
::
++  test-add-client
  =|  run=@ud 
  =^  move  agent  (~(on-poke agent (bowl run)) %pomodoro-action !>([%add-client ~nec]))
  =+  !<(=state on-save:agent)
  %+  expect-eq
    !>  [%0 watchers={~nec} status=%break]
    !>  watchers.state
  ==
--
++  test-delta
  =|  run=@ud
  =^  move  agent  (~(on-poke agent (bowl run)) %delta-action !>([%push ~zod 30.000]))
  =+ !<(=state on-save:agent)
  %+  expect-eq
    !>  `(list @)`~30.000]
    !>  values.state
--
