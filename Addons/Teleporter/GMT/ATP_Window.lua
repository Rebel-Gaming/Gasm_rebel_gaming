

function ATP_window_OnLoad()
this:RegisterForDrag("LeftButton");
end

function ATP_window_OnDragStart()
this:StartMoving()
end

function ATP_window_OnDragStop()
this:StopMovingOrSizing()
end
