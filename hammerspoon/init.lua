hs = hs

hs.loadSpoon("AClock")

hs.hotkey.bind({"alt"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")

-- ─────────────────────────────────────────
-- App Launcher (Cmd+Alt+letra)
-- ─────────────────────────────────────────
local apps = {
  G = "Ghostty",
  S = "Slack",
  C = "Google Chrome",
  M = "Spotify",
  W = "WhatsApp",
  T = "Microsoft Teams",
  N = "Notion",
}

for key, app in pairs(apps) do
  hs.hotkey.bind({"cmd", "alt"}, key, function()
    hs.application.launchOrFocus(app)
  end)
end

-- ─────────────────────────────────────────
-- Window Management (Cmd+Alt+arrow / hjkl)
-- ─────────────────────────────────────────
local function moveWindow(x, y, w, h)
  local win = hs.window.focusedWindow()
  if not win then return end
  local screen = win:screen():frame()
  win:setFrame({
    x = screen.x + (screen.w * x),
    y = screen.y + (screen.h * y),
    w = screen.w * w,
    h = screen.h * h,
  })
end

-- Mitades
hs.hotkey.bind({"cmd", "alt"}, "left",  function() moveWindow(0,   0, 0.5, 1)   end) -- mitad izquierda
hs.hotkey.bind({"cmd", "alt"}, "right", function() moveWindow(0.5, 0, 0.5, 1)   end) -- mitad derecha
hs.hotkey.bind({"cmd", "alt"}, "up",    function() moveWindow(0,   0, 1,   0.5) end) -- mitad superior
hs.hotkey.bind({"cmd", "alt"}, "down",  function() moveWindow(0,   0.5, 1, 0.5) end) -- mitad inferior

-- Pantalla completa
hs.hotkey.bind({"cmd", "alt"}, "F", function() moveWindow(0, 0, 1, 1) end)

-- Centrar (70% del tamaño)
hs.hotkey.bind({"cmd", "alt"}, "Z", function() moveWindow(0.15, 0.15, 0.7, 0.7) end)

-- Cuadrantes
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "left",  function() moveWindow(0,   0,   0.5, 0.5) end) -- arriba izq
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "right", function() moveWindow(0.5, 0,   0.5, 0.5) end) -- arriba der
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "up",    function() moveWindow(0,   0.5, 0.5, 0.5) end) -- abajo izq
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "down",  function() moveWindow(0.5, 0.5, 0.5, 0.5) end) -- abajo der

-- ─────────────────────────────────────────
-- Clipboard Manager
-- ─────────────────────────────────────────
local clipboardHistory = {}
local maxHistory = 20
local clipboardWatcher = nil
local clipboardChooser = nil

local function updateClipboard()
  local content = hs.pasteboard.getContents()
  if content and content ~= "" and content ~= clipboardHistory[1] then
    table.insert(clipboardHistory, 1, content)
    if #clipboardHistory > maxHistory then
      table.remove(clipboardHistory)
    end
  end
end

local function showClipboard()
  if clipboardChooser then
    clipboardChooser:delete()
  end

  local choices = {}
  for i, item in ipairs(clipboardHistory) do
    local preview = item:gsub("\n", " "):sub(1, 80)
    table.insert(choices, {
      text = preview,
      subText = "#" .. i,
      item = item,
    })
  end

  clipboardChooser = hs.chooser.new(function(choice)
    if choice then
      hs.pasteboard.setContents(choice.item)
      hs.eventtap.keyStroke({"cmd"}, "v")
    end
  end)

  clipboardChooser:choices(choices)
  clipboardChooser:show()
end

clipboardWatcher = hs.timer.new(1, updateClipboard)
clipboardWatcher:start()

hs.hotkey.bind({"cmd", "alt"}, "V", showClipboard)
