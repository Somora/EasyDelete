-- Hook the OnShow function for the DELETE_GOOD_ITEM static popup dialog.
-- This function is called whenever the dialog is shown.
hooksecurefunc(StaticPopupDialogs["DELETE_GOOD_ITEM"], "OnShow", function(s)
    -- Automatically fill the edit box with the required confirmation text.
    -- DELETE_ITEM_CONFIRM_STRING is a predefined global variable in WoW that
    -- holds the exact string the game expects the user to enter to confirm
    -- the deletion of a "good" item (an item of green quality or higher).
    s.editBox:SetText(DELETE_ITEM_CONFIRM_STRING)
end)
