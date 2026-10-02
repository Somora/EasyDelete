local deleteDialog = StaticPopupDialogs and StaticPopupDialogs.DELETE_GOOD_ITEM

if deleteDialog then
    hooksecurefunc(deleteDialog, "OnShow", function(dialog, data)
        local editBox
        local confirmText

        if dialog then
            -- Forever and modern Retail expose the edit box through a getter.
            if dialog.GetEditBox then
                editBox = dialog:GetEditBox()
            end

            editBox = editBox or dialog.EditBox or dialog.editBox

            if not editBox and dialog.GetName then
                local name = dialog:GetName()
                if name then
                    editBox = _G[name .. "EditBox"]
                end
            end
        end

        if not editBox then
            editBox = StaticPopup1EditBox
        end

        -- Some delete popups require item-specific text instead of the generic
        -- DELETE confirmation string (for example unique item names).
        if type(data) == "string" and data ~= "" then
            confirmText = data
        elseif dialog and type(dialog.data) == "string" and dialog.data ~= "" then
            confirmText = dialog.data
        else
            confirmText = DELETE_ITEM_CONFIRM_STRING
        end

        if not editBox or type(confirmText) ~= "string" or confirmText == "" then
            return
        end

        editBox:SetText(confirmText)
        editBox:HighlightText(0, 0)
    end)
end
