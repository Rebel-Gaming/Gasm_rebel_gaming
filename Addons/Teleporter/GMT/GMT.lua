local _variablesLoaded = false;
SCROLLSETTEXT_TO_DISPLAY = 9;
ATP_FRAME_SAVESET_HEIGHT = 12;
MAX_SCROLLSETTEXT_FROM_SERVER = 50;


--Bindings--

--initiaize--
function ATP_Initialize()
if (ATP_INITIALIZED) then return; end
	ATP_teleport_table_init();
	ATP_INITIALIZED = true;
	ATP_print("Use /atp or /teleport to show GMT.");
	SlashCmdList["ATP"] = ATP_Slash_Handler;
	SLASH_ATP1 = "/atp";
	SLASH_ATP2 = "/teleport";

	ATP_searchindex = {};
	ATP_tablenumsearch = 10;
        ATP_searchstring = {};
	ATP_searchstringgo = {};
	ATP_areanumsearch = 10;
	ATP_mainlist_click();
end

function ATP_OnLoad()
	this:RegisterEvent("VARIABLES_LOADED");
	ATP_AREA = "Alterac Mountains";
end

function ATP_OnEvent(event)
	if (event == "VARIABLES_LOADED")then
ATP_Initialize();
	end
end



function ATP_Slash_Handler(msg)
   local frame = ATP_window
   if(frame:IsVisible() ) then
      frame:Hide();
   else
      frame:Show();
   end  
end

function ATP_print(printout)
	DEFAULT_CHAT_FRAME:AddMessage(printout,0.5,1,1);	
end
function ATP_pw(printout)
	DEFAULT_CHAT_FRAME:AddMessage(printout,1,1,1);	
end
function ATP_printred(printout)
	DEFAULT_CHAT_FRAME:AddMessage(printout,0.5,1,1);	
end

function ATP_Copy_Table(src, dest)
	for index, value in pairs(src) do
		if (type(value) == "table") then
			dest[index] = {};
			ATP_Copy_Table(value, dest[index]);
		else
			dest[index] = value;
		end
	end
end

function ATP_zonelist_Update()
	ATP_Table_num(ATP_teleports.zoneindex);
	local numsaves, totalCount = ATP_tablenum;
	local button;
	local zonelist_offset = FauxScrollFrame_GetOffset(ATP_zonelist_ScrollFrame);
	local zonelistIndex;
	showScrollBar = 1;
	
	for ATP_j=1, 9, 1 do
		zonelistIndex = zonelist_offset + ATP_j;
		button = getglobal("ATP_zonelist_line"..ATP_j);
		button.zonelistIndex = zonelistIndex;
		name = (ATP_saveindex[zonelistIndex]);
		getglobal("ATP_zonelist_line"..ATP_j.."Name"):SetText(name);			
		if ( ATP_zone_window.selectedzone == zonelistIndex ) then
			button:LockHighlight();
		else
			button:UnlockHighlight();
		end
		
		if ( zonelistIndex > numsaves ) then
			button:Hide();
		else
			button:Show();
		end		
	end	
	
	
	-- ScrollFrame update
	FauxScrollFrame_Update(ATP_zonelist_ScrollFrame, numsaves, 9, 12 );

end



function ATP_arealist_Update()
	ATP_Value_num(ATP_teleports.zoneindex[ATP_AREA]);
	local numsaves, totalCount = ATP_valuenum;
	local button;
	local arealist_offset = FauxScrollFrame_GetOffset(ATP_arealist_ScrollFrame);
	local arealistIndex;
	showScrollBar = 1;
	
	for ATP_k=1, 9, 1 do
		arealistIndex = arealist_offset + ATP_k;
		button = getglobal("ATP_arealist_line"..ATP_k);
		button.arealistIndex = arealistIndex;
		name = (ATP_saveindex[arealistIndex]);
		getglobal("ATP_arealist_line"..ATP_k.."Name"):SetText(name);			
		
		if ( ATP_area_window.selectedarea == arealistIndex ) then
			button:LockHighlight();
		else
			button:UnlockHighlight();
		end
		
		if ( arealistIndex > numsaves ) then
			button:Hide();
		else
			button:Show();
		end		
	end		
	-- ScrollFrame update
	FauxScrollFrame_Update(ATP_arealist_ScrollFrame, numsaves, 9, 12 );
end

function ATP_zonesearchlist_Update()	
	local numsaves, totalCount = ATP_tablenumsearch;
	local button;
	local zonesearchlist_offset = FauxScrollFrame_GetOffset(ATP_zonesearchlist_ScrollFrame);
	local zonesearchlistIndex;
	showScrollBar = 1;

	for ATP_m=1, 9, 1 do
		zonesearchlistIndex = zonesearchlist_offset + ATP_m;
		button = getglobal("ATP_zonesearchlist_line"..ATP_m);
		button.zonesearchlistIndex = zonesearchlistIndex;
		name = (ATP_searchindex[zonesearchlistIndex]);
		getglobal("ATP_zonesearchlist_line"..ATP_m.."Name"):SetText(name);
		if ( ATP_zonesearch_window.selectedzonesearch == zonesearchlistIndex ) then
			button:LockHighlight();
		else
			button:UnlockHighlight();
		end

		if ( zonesearchlistIndex > numsaves ) then
			button:Hide();
		else
			button:Show();
		end		
	end

	-- ScrollFrame update
	FauxScrollFrame_Update(ATP_zonesearchlist_ScrollFrame, numsaves, 9, 12 );

end

function ATP_areasearchlist_Update()	
	local numsaves, totalCount = ATP_areanumsearch;
	local button;
	local areasearchlist_offset = FauxScrollFrame_GetOffset(ATP_areasearchlist_ScrollFrame);
	local areasearchlistIndex;
	showScrollBar = 1;

	for ATP_o=1, 9, 1 do
		areasearchlistIndex = areasearchlist_offset + ATP_o;
		button = getglobal("ATP_areasearchlist_line"..ATP_o);
		button.areasearchlistIndex = areasearchlistIndex;
		name = (ATP_searchstring[areasearchlistIndex]);
		gocommand = (ATP_searchstringgo[ATP_areanumsearch]);
		getglobal("ATP_areasearchlist_line"..ATP_o.."Name"):SetText(name);
		if ( ATP_areasearch_window.selectedareasearch == areasearchlistIndex ) then
			button:LockHighlight();
		else
			button:UnlockHighlight();
		end
		
		if ( areasearchlistIndex > numsaves ) then
			button:Hide();
		else
			button:Show();
		end		
	end	
	-- ScrollFrame update
	FauxScrollFrame_Update(ATP_areasearchlist_ScrollFrame, numsaves, 9, 12 );

end

function ATP_zonename_OnClick(button)
	if ( button == "LeftButton" ) then	
		ATP_zone_window.selectedzone = getglobal("ATP_zonelist_line"..this:GetID()).zonelistIndex;
		ATP_buttonzonename = getglobal("ATP_zonelist_line"..this:GetID().."Name"):GetText();
		ATP_AREA = ATP_buttonzonename
		ATP_zonelist_Update();
		ATP_arealist_Update();
	end
end

function ATP_zonesearchname_OnClick(button)
	if ( button == "LeftButton" ) then
	ShowUIPanel(ATP_area_window);
	HideUIPanel(ATP_areasearch_window);
		ATP_zonesearch_window.selectedzonesearch = getglobal("ATP_zonesearchlist_line"..this:GetID()).zonesearchlistIndex;
		ATP_buttonzonesearchname = getglobal("ATP_zonesearchlist_line"..this:GetID().."Name"):GetText();
		ATP_AREA = ATP_buttonzonesearchname
		ATP_zonesearchlist_Update();
		ATP_arealist_Update();
	end
end

function ATP_areasearchname_OnClick(button)
	if ( button == "LeftButton" ) then	
		ATP_areasearch_window.selectedareasearch = getglobal("ATP_areasearchlist_line"..this:GetID()).areasearchlistIndex;
		ATP_buttonareasearchname = getglobal("ATP_areasearchlist_line"..this:GetID().."Name"):GetText();
		ATP_gotp = (ATP_searchstringgo[ATP_areasearch_window.selectedareasearch]);
		ATP_areasearchlist_Update();		
	end
end



function ATP_areaname_OnClick(button)
	if ( button == "LeftButton" ) then
		ATP_area_window.selectedarea = getglobal("ATP_arealist_line"..this:GetID()).arealistIndex;
		ATP_buttonareaname = getglobal("ATP_arealist_line"..this:GetID().."Name"):GetText();
		ATP_gotp = (ATP_teleports.zoneindex[ATP_AREA][ATP_buttonareaname]);
		ATP_arealist_Update();
	end
end

function ATP_teleportgo_click()
	if (ATP_gotp ~= nil)then
		SendChatMessage(ATP_gotp, "GUILD");
	end
end

function ATP_Table_num(src)
ATP_tablenum = 0;
ATP_saveindex = {};
	for index, value in pairs(src) do
		if (type(value) == "table") then
			ATP_tablenum = ATP_tablenum + 1;
			ATP_saveindex[ATP_tablenum] = (index);		
		end
	end
	ATP_sort(ATP_saveindex, ATP_tablenum, 0, ATP_saveindex);
end

function ATP_Value_num(src)
ATP_valuenum = 0;
ATP_saveindex = {};
	for index, value in pairs(src) do
		if (type(value) == "string") then
			ATP_valuenum = ATP_valuenum + 1;
			ATP_saveindex[ATP_valuenum] = (index);
		end
	end
	ATP_sort(ATP_saveindex, ATP_valuenum, 0, ATP_saveindex);
end

function ATP_sort(src, stop, doit, src2)
local ATP_i = 0;
local ATP_swapped = 0;
local ATP_tmp;
	repeat
		ATP_swapped = 0;
		for ATP_i = 1, stop - 1, 1 do
			if(src[ATP_i] > src[ATP_i + 1]) then
				ATP_tmp = src[ATP_i];
				src[ATP_i] = src[ATP_i + 1];
				src[ATP_i + 1] = ATP_tmp;
				ATP_swapped = 1;
				if(doit == 1) then
					ATP_tmp = src2[ATP_i];
					src2[ATP_i] = src2[ATP_i + 1];
					src2[ATP_i + 1] = ATP_tmp;
				end
			end
		end
	until(ATP_swapped == 0)
end

function ATP_find_zone(src)
ATP_tablenumsearch = 0;
ATP_searchindex = {};
	for index, value in pairs(src) do
		if (type(value) == "table") then
			local valuename = nil;
			local lowerc = strlower(index)
			tablename = string.find(lowerc, ATP_searchfortp)
				if (tablename ~= nil)then
			ATP_tablenumsearch = ATP_tablenumsearch + 1;
			ATP_searchindex[ATP_tablenumsearch] = (index);
				end
		end
	end
	ATP_sort(ATP_searchindex, ATP_tablenumsearch, 0, ATP_searchindex);
end

function ATP_find_area(src)
	for index, value in pairs(src) do
		if (type(value) == "string") then
			local valuename = nil;
			local lowerc = strlower(index)
			stringname = string.find(lowerc, ATP_searchfortp)
				if (stringname ~= nil)then
			ATP_areanumsearch = ATP_areanumsearch + 1;
			ATP_searchstring[ATP_areanumsearch] = (index);
			ATP_searchstringgo[ATP_areanumsearch] = (value);			
			--ATP_print(ATP_areanumsearch);
				end
		end
	end
	ATP_sort(ATP_searchstring, ATP_areanumsearch, 1, ATP_searchstringgo);
end

function ATP_passalltablesto_find_area(src)
ATP_searchstringgo = {};
ATP_searchstring = {};
ATP_areanumsearch = 0;
ATP_tablenum = 1;
ATP_saveindex = {};
	for index, value in pairs(src) do
		if (type(value) == "table") then
			ATP_find_area(ATP_teleports.zoneindex[index]);
		end
	end
end

function ATP_mainlist_click()
ShowUIPanel(ATP_area_window);
HideUIPanel(ATP_areasearch_window);
ShowUIPanel(ATP_zone_window);
HideUIPanel(ATP_zonesearch_window);
ATP_zonesearchlist_Update();
ATP_areasearchlist_Update();
ATP_zonelist_Update();
ATP_arealist_Update();
end

function ATP_teleportsearch_click()
if(ATP_searchfortp == "") then
ATP_mainlist_click();
return;
end
HideUIPanel(ATP_area_window);
ShowUIPanel(ATP_areasearch_window);
HideUIPanel(ATP_zone_window);
ShowUIPanel(ATP_zonesearch_window);
ATP_passalltablesto_find_area(ATP_teleports.zoneindex);
ATP_find_zone(ATP_teleports.zoneindex);
ATP_zonesearchlist_Update();
ATP_areasearchlist_Update();
ATP_zonelist_Update();
ATP_arealist_Update();
end
