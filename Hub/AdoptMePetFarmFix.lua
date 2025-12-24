if not _G.hola then
  _G.hola = true
  task.wait(10)
  if _G.savingElements["toggles"]['petautofarm'].CurrentValue then
      _G.savingElements["toggles"]['petautofarm']:Set(false)
      task.wait(5)
      _G.savingElements["toggles"]['petautofarm']:Set(true)
  end
  while true do
    task.wait(360)
    if _G.savingElements["toggles"]['petautofarm'].CurrentValue then
      _G.savingElements["toggles"]['petautofarm']:Set(false)
      task.wait(10)
      _G.savingElements["toggles"]['petautofarm']:Set(true)
    end
  end
end
