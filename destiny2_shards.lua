-- 06.04.2022
-- Clear engrams before running
distance = 3500
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
    buyAndDismantleCycle()
    if (not IsKeyLockOn(keyRequired)) then do OutputLogMessage('End script\n') return end end
    buyAndDismantleCycle()
    if (not IsKeyLockOn(keyRequired)) then do OutputLogMessage('End script\n') return end end
    buyGlimmer()
    cycle = cycle + 1
  end
  OutputLogMessage('End script\n')
end

--23715 Glimmer per cycle
function buyAndDismantleCycle()
  --Assuming in character page
  if (not IsKeyLockOn(keyRequired)) then do OutputLogMessage('End script\n') return end end
  PressAndReleaseKey('A')
  Sleep(1000)
  PressAndReleaseKey('A')
  Sleep(1000)
  MoveMouseTo(31193, 24092) --Move to Armor
  Sleep(200)
  PressAndReleaseMouseButton(1)
  Sleep(1500)
  MoveMouseTo(12190, 50779) --Move to Level
  Sleep(200)
  PressAndReleaseMouseButton(1)
  Sleep(2000)
  PressAndReleaseKey('right')
  Sleep(1000)
  for i = 0, 4 do
    if (not IsKeyLockOn(keyRequired)) then do OutputLogMessage('End script\n') return end end
    moveToItemInCollection(i)
    Sleep(500)
    for j = 0, 8 do
      if (not IsKeyLockOn(keyRequired)) then do OutputLogMessage('End script\n') return end end
      buyOneItem()
    end
  end
  
  --Go back to character page
  PressAndReleaseKey('F1')
  Sleep(1500)
  PressAndReleaseKey('F1')
  Sleep(2000)
  
  for i = 0, 4 do
    if (not IsKeyLockOn(keyRequired)) then do OutputLogMessage('End script\n') return end end
    moveToItemInRightColumn(i)
    Sleep(1000)
    moveToItemInRightColumnExtendedItems(i)
    Sleep(1000)
    for j = 0, 8 do
      if (not IsKeyLockOn(keyRequired)) then do OutputLogMessage('End script\n') return end end
      dismantleOneItem()
    end
  end
end

-- Buy 50000 Glimmer
function buyGlimmer()
  -- Assume in character page
  if (not IsKeyLockOn(keyRequired)) then do OutputLogMessage('End script\n') return end end
  PressAndReleaseKey('F1')
  Sleep(5000)
  
  -- Need to be changed each day
  moveToItemOfVendor(5)
  Sleep(300)
  for i = 1, 20 do
    if (not IsKeyLockOn(keyRequired)) then do OutputLogMessage('End script\n') return end end
    PressAndReleaseMouseButton(1)
    Sleep(1000)
  end

  -- Need to be changed each day
  moveToItemOfVendor(1)
  Sleep(300)
  for i = 1, 5 do
    if (not IsKeyLockOn(keyRequired)) then do OutputLogMessage('End script\n') return end end
    PressAndReleaseMouseButton(1)
    Sleep(1000)
  end
  
  if (not IsKeyLockOn(keyRequired)) then do OutputLogMessage('End script\n') return end end
  --Go to character page
  PressAndReleaseKey('F1')
  Sleep(3000)
end

function buyOneItem()
  PressMouseButton(1)
  Sleep(3300)
  ReleaseMouseButton(1)
  Sleep(700)
end

function dismantleOneItem()
  PressKey('F')
  Sleep (1300)
  ReleaseKey('F')
  Sleep (700)
end

function captureMousePos()
  x, y = GetMousePosition()
  OutputLogMessage("(%d, %d)\n", x, y)
  Sleep(1000)
end

function openCollection()
  PressAndReleaseKey('F1')
  Sleep(10000)
end

function moveToItemInCollection(i)
  MoveMouseTo(24790 + i * distance , 53239)
end

function moveToItemOfVendor(i)
  MoveMouseTo(39900 + i * distance , 10976)
end

function moveToItemInRightColumn(i)
  MoveMouseTo(47788, 16441 + i * 7500)
end

function moveToItemInRightColumnExtendedItems(i)
  MoveMouseTo(51552, 16441 + i * 7500)
end
