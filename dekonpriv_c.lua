local soundElements = {}  -- Armazena referências aos sons
local soundDistance = 30  -- Distância em que o som é audível

-- Função para verificar a distância do jogador e tocar o som quando estiver próximo
addEventHandler("onClientRender", root, function()
    local playerX, playerY, playerZ = getElementPosition(localPlayer)

    for _, obj in ipairs(getElementsByType("object")) do
        if getElementModel(obj) == 1805 then  -- Verifica se o objeto é o correto
            local objX, objY, objZ = getElementPosition(obj)
            local distance = getDistanceBetweenPoints3D(playerX, playerY, playerZ, objX, objY, objZ)

            -- Se o jogador estiver perto o suficiente e o som ainda não estiver tocando
            if distance <= soundDistance and not soundElements[obj] then
                -- Cria e reproduz o som 3D
                local sound = playSound3D("som.mp3", objX, objY, objZ, true)
                setSoundMaxDistance(sound, soundDistance)  -- Define a distância máxima para o som ser audível
                soundElements[obj] = sound  -- Armazena o som associado ao objeto
            elseif distance > soundDistance and soundElements[obj] then
                -- Para o som se o jogador sair da área
                stopSound(soundElements[obj])
                soundElements[obj] = nil  -- Remove a referência ao som
            end
        end
    end
end)
