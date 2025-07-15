-- Simple Cycle
keyRequired = 'scrolllock'

function OnEvent(event, arg)
  if (event == 'MOUSE_BUTTON_PRESSED' and arg == 3) then
    ClearLog()
    OutputLogMessage('Script started\n')
    auto()
  end
end

function auto()
  cycle = 0
  while(IsKeyLockOn(keyRequired)) do
    OutputLogMessage('Cycle %d running\n', cycle)
    if (not IsKeyLockOn(keyRequired)) then do OutputLogMessage('End script\n') return end end
    doCycle()
    cycle = cycle + 1
  end
  OutputLogMessage('End script\n')
end

-- 
function doCycle()
  PressAndReleaseKey('T')
  Sleep(2000)
  PressAndReleaseKey('T')
  Sleep(2000)
  PressAndReleaseKey('R')
  Sleep(3000)
  moveToConfirmReady()
  PressAndReleaseMouseButton(1)
  Sleep(1000)
end

function captureMousePos()
  x, y = GetMousePosition()
  OutputLogMessage("(%d, %d)\n", x, y)
  Sleep(1000)
end

function moveToConfirmReady()
  MoveMouseTo(31116, 34442)
end
