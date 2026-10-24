addEventHandler("onResourceStart", resourceRoot, function()
    for _, objectData in ipairs(objects) do
        local obj = createObject(objectData.id, unpack(objectData.position))
        setElementDimension(obj, 0)  -- Define a dimensão para 0 (padrão)
        setElementInterior(obj, 0)   -- Define o interior para 0 (padrão)
    end
end)
