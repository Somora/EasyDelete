local deleteDialog = StaticPopupDialogs and StaticPopupDialogs.DELETE_GOOD_ITEM

if deleteDialog then
    hooksecurefunc(deleteDialog, "OnShow", function(dialog)
        local confirmText = DELETE_ITEM_CONFIRM_STRING
        local editBox

        if dialog then
            editBox = dialog.editBox

            if not editBox and dialog.GetName then
                editBox = _G[dialog:GetName() .. "EditBox"]
            end
        end

        if not editBox then
            editBox = StaticPopup1EditBox
        end

        if not editBox or type(confirmText) ~= "string" or confirmText == "" then
            return
        end

        editBox:SetText(confirmText)
        editBox:HighlightText(0, 0)
    end)
end
