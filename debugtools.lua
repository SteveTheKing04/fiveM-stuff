---------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------put entity name or hash here---------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------
  stuff = -739654066
----------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------this sets delete gun toggle to off --------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
 deleteGunToggle = false
----------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------this gets info about spawned entity and player----------------------------------------
----------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()	
  while true do
     Citizen.Wait(0)
	 playerInteriorID = GetInteriorFromEntity(GetPlayerPed(PlayerId()))  
	 playerPed = GetPlayerPed(PlayerId())
     playerCoords = GetEntityCoords(GetPlayerPed(PlayerId()), true)
	 playerCoordsX = playerCoords.x
	 playerCoordsY = playerCoords.y
	 playerCoordsZ = playerCoords.z
	 playerHeading = GetEntityHeading(GetPlayerPed(PlayerId()))
	 PlayerRoomKey = GetRoomKeyFromEntity(GetPlayerPed(PlayerId()))
	 playerInteriorID = GetInteriorFromEntity(GetPlayerPed(PlayerId()))
	 entityRoomKey = GetRoomKeyFromEntity(a)
	 entityInteriorID = GetInteriorFromEntity(a)
     entityCoords = GetEntityCoords(closestEntity, true)
	 interiorGroupID = GetInteriorGroupId(entityInteriorID)
     ForceRoomForEntity(a, playerInteriorID, PlayerRoomKey)
	 EntityInterior = GetInteriorFromEntity(a)
	 EntityRoomKey = GetRoomKeyFromEntity(a)
-----------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------this checks if the spawned entity exists and moves it as player pushes buttons---------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------
	if not DoesEntityExist(a) or DoesEntityExist(GetClosestObjectOfType(playerCoordsX, playerCoordsY, playerCoordsZ, 50.0, stuff, 0, 1, 0)) then
	 a = GetClosestObjectOfType(playerCoordsX, playerCoordsY, playerCoordsZ, 50.0, stuff, 0, 1, 0)
    end
    if DoesEntityExist(a) then
     b = ObjToNet(a)	 
--this gets the entity coords
		entityCoords = GetEntityCoords(a)
		entityCoords1 = GetEntityCoords(b)		
--this splits up the coords 
		  entityX = entityCoords.x
		  entityY = entityCoords.y
		  entityZ = entityCoords.z
		  entityX1 = entityCoords1.x
		  entityY1 = entityCoords1.y
		  entityZ1 = entityCoords1.z		  
--this gets the entity rotation
		entityRot = GetEntityRotation(a)
		entityRot1 = GetEntityRotation(b)		
--this splits up the rotation 
		  entityRotX = entityRot.x
	      entityRotY = entityRot.y
		  entityRotZ = entityRot.z
		  entityRotX1 = entityRot1.x
	      entityRotY1 = entityRot1.y
		  entityRotZ1 = entityRot1.z		  
	end
--if left shift is pressed then movement speed is slower
	if IsControlPressed(0, 21) then
      	moveSpeed = 0.01
		moveSpeed1 = 1.0
    else 
        moveSpeed = 0.1
		moveSpeed1 = 0.3
	 end

--this sets "a" to nil if no entity was spawned and no entity of type found near player
      if not DoesEntityExist(a) then
       a = nil
      end
--home key
-- if control "left" key is pressed then it spawns the entity of your choosing	 
	 if IsControlPressed(0, 213) then
	    Citizen.Wait(500)
		 spawnStuff()
	 end
--left key
-- if control "left" key is pressed then it adds 0.01 to the x coord
	 if DoesEntityExist(a) and IsControlPressed(0, 174) then	    		
	    entityX = entityCoords.x + moveSpeed
		--sets the entity's position with result
        SetEntityCoords(a, entityX, entityY, entityZ)
	    entityX1 = entityCoords1.x + moveSpeed
		--sets the entity's position with result
        SetEntityCoords(b, entityX1, entityY1, entityZ1)			
	 end
	  	
	 
--right key
-- if control "right" key is pressed then it subtract's 0.01 from the x coord
	 if DoesEntityExist(a) and IsControlPressed(0, 175) then
	    --entityCoords = GetEntityCoords(a)
	    entityX = entityCoords.x - moveSpeed
		--sets the entity's position with result
        SetEntityCoords(a, entityX, entityY, entityZ)
	    --entityCoords = GetEntityCoords(a)
	    entityX1 = entityCoords1.x - moveSpeed
		--sets the entity's position with result
        SetEntityCoords(b, entityX1, entityY1, entityZ1)			
	 end
--pageup
-- if control "pageUp" key is pressed then it adds 0.01 to the z coord
	 if DoesEntityExist(a) and IsControlPressed(0, 10) then	    
		entityZ = entityCoords.z + moveSpeed
--sets the entity's position with result
        SetEntityCoords(a, entityX, entityY, entityZ)
		entityZ1 = entityCoords1.z + moveSpeed
--sets the entity's position with result
        SetEntityCoords(b, entityX1, entityY1, entityZ1)			
	 end
--pagedown
-- if control "pageDown" key is pressed then it subtract's 0.01 from the z coord
	 if DoesEntityExist(a) and IsControlPressed(0, 11) then
		entityZ = entityCoords.z - moveSpeed
--sets the entity's position with result
        SetEntityCoords(a, entityX, entityY, entityZ)
		entityZ1 = entityCoords1.z - moveSpeed
--sets the entity's position with result
        SetEntityCoords(b, entityX1, entityY1, entityZ1)		
	end
--up key
-- if control "up" key is pressed then it subtract's 0.01 from the y coord
	 if DoesEntityExist(a) and IsControlPressed(0, 27) then	   
		entityY = entityCoords.y - moveSpeed	 
--sets the entity's position with result
       	SetEntityCoords(a, entityX, entityY, entityZ)
		entityY1 = entityCoords1.y - moveSpeed	 
--sets the entity's position with result
       	SetEntityCoords(b, entityX1, entityY1, entityZ1)		
	 end
--down key
-- if control "down" key is pressed then it adds 0.01 to the y coord
	 if DoesEntityExist(a) and IsControlPressed(0, 173) then
		entityY = entityCoords.y + moveSpeed
        SetEntityCoords(a, entityX, entityY, entityZ)
		entityY1 = entityCoords1.y + moveSpeed
        SetEntityCoords(b, entityX1, entityY1, entityZ1)			
	 end
--leftshift AND "E"
-- if left shift AND "E" key are pressed then it deletes the entity
--and any other entity close to the player with the same hashkey
	 if IsControlPressed(0, 21) and IsControlPressed(0, 38) then
	    if DoesEntityExist(a) or DoesEntityExist(closestEntity) then 
	     deleteStuff()
	    end 
	 end
--numberpad "+" key
-- if numberpad "+" key is pressed then it adds 0.1 to the entity's heading(spins the thing)
	 if DoesEntityExist(a) and IsControlPressed(0, 96) then
	    entityRotZ = entityRotZ + moveSpeed	  
--sets the entity's heading with result
		SetEntityRotation(a, entityRotX, entityRotY, entityRotZ)
	    entityRotZ1 = entityRotZ1 + moveSpeed	  
--sets the entity's heading with result
		SetEntityRotation(b, entityRotX1, entityRotY1, entityRotZ1)		
	 end
--numberpad "-" key
-- if numberpad "-" key is pressed then it subtract's 0.1 from the entity's heading(spins the thing)
	 if DoesEntityExist(a) and IsControlPressed(0, 97) then
        entityRotZ = entityRotZ - moveSpeed			
		--sets the entity's heading with result
		SetEntityRotation(a, entityRotX, entityRotY, entityRotZ)
        entityRotZ1 = entityRotZ1 - moveSpeed			
		--sets the entity's heading with result
		SetEntityRotation(b, entityRotX1, entityRotY1, entityRotZ1)		
	 end
	 --the "[" key
     	if DoesEntityExist(a) and IsControlPressed(0, 39) then
        --entityRot = GetEntityRotation(a)
	    entityRotY = entityRotY + moveSpeed
		--sets the entity's rotation with result
		SetEntityRotation(a, entityRotX, entityRotY, entityRotZ)
        --entityRot = GetEntityRotation(a)
	    entityRotY1 = entityRotY1 + moveSpeed
		--sets the entity's rotation with result
		SetEntityRotation(b, entityRotX1, entityRotY1, entityRotZ1)		
	 end
	 -- the "]" key
     	if (DoesEntityExist(a) and IsControlPressed(0, 40)) then
        --entityRot = GetEntityRotation(a)		
	    entityRotY = entityRotY - moveSpeed 		
		--sets the entity's rotation with result
		SetEntityRotation(a, entityRotX, entityRotY, entityRotZ)
	        --entityRot = GetEntityRotation(a)		
	    entityRotY1 = entityRotY1 - moveSpeed 		
		--sets the entity's rotation with result
		SetEntityRotation(b, entityRotX1, entityRotY1, entityRotZ1)	
	 end
    end
end)

function deleteStuff()

 --this delete's the entity that was spawned or 
 --any close by entity with the the same hash key 
 if DoesEntityExist(closestEntity) and not DoesEntityExist(a) then
 --closestEntity = NetworkGetNetworkIdFromEntity(closestEntity)    
 SetEntityAsMissionEntity(closestEntity,true,true) 
 DeleteObject(closestEntity)
 end
 if DoesEntityExist(a) then
  --a = NetworkGetNetworkIdFromEntity(a)
  SetEntityAsMissionEntity(a,true,true)
  DeleteObject(a)
 end 
 if DoesEntityExist(spawnedVeh) then

 SetEntityAsMissionEntity(spawnedVeh,true,true)
 DeleteVehicle(spawnedVeh)
 DeleteEntity(spawnedVeh)
 end
 if DoesEntityExist(spawnPed) or DoesEntityExist(closestPed) then
 SetEntityAsMissionEntity(spawnPed,true,true)
 SetEntityAsMissionEntity(closestPed,true,true)
 DeletePed(spawnPed)
 end
end
-- this sets the entity's transparency
function invisibleStuff()
 SetEntityAsMissionEntity(a)
  SetEntityAlpha(a, 255)
end
----------------------------
--this is the ACTUAL spawner
function spawnStuff()
Citizen.CreateThread(function() 
--this requests the model of what is to be spawned
	if not HasModelLoaded(stuff) then
	 Citizen.Wait(0)
	 RequestModel(stuff)
--if model is a veh then spawn a veh	 
	end
	if IsModelAVehicle(stuff) then 
	 spawnedVeh = CreateVehicle(stuff, playerCoordsX, playerCoordsY, playerCoordsZ, playerHeading, 0, 0, 0)
	end
--spawn the object	
	a = ObjToNet(CreateObjectNoOffset(stuff, playerCoordsX, playerCoordsY, playerCoordsZ, 1, 0, 0))
	SetEntityCollision(a, false, false)
    FreezeEntityPosition(a, true)
  SetEntityHeading(a, playerHeading)
end)
end
------------------------------------------------------------------------------------------------------------------
----------------this is the "delete gun active" text that gets displayed if the delete gun is on------------------
------------------------------------------------------------------------------------------------------------------
 Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(0) 
	  if deleteGunToggle~=false then 	  
  local position = "DELETE GUN ACTIVE"
  local offset = {x = 0.290, y = 0.850}
  local rgb = {r = 255, g = 0, b = 0}
  local alpha = 255
  local scale = 1.0
  local font = 0
            SetTextColour(rgb.r, rgb.g, rgb.b, alpha)
            SetTextFont(font)
		    SetTextScale(scale, scale)
			SetTextWrap(0.0, 1.0)
			SetTextCentre(false)
			SetTextDropshadow(2, 2, 0, 0, 0)
			SetTextEdge(1, 0, 0, 0, 205)
			SetTextEntry("STRING")
			AddTextComponentString(position)			
			DrawText(offset.x, offset.y)       
	  end	  
	end		
end)

------------------------------------------------------------------------------------------------------------------
-------------------------------this is the delete gun activation controller----------------------------------------
------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
      Wait(2000)	 
		if gary ~=false and deleteGunToggle ~=false then
            deleteGunToggle = false	
        end
    end
end)
----------------------------------------------------------------------------------------------------------------------
------------------------------------this is the "meat" of the delete gun----------------------------------------------
-------------------if the delete gun is active the it deletes what ever the player is looking at----------------------
----------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    pedDeleted = "a ped got DELETED: "
    vehDeleted = "a veh got DELETED: "
	objDeleted = "an obj get DELETED: "
   while true do  
     Wait(1000)
      gary = IsControlPressed(0, 178)
      if gary ~=false and deleteGunToggle ~=true then
	    deleteGunToggle = true
		 Wait(0)
      end
	  Wait(0)
	dude5 = PlayerId()
	dude6 = IsPlayerFreeAiming(dude5)
	 if dude6 ~=false and deleteGunToggle ==true then 
	 Wait(0) 
	 --BOOL GET_ENTITY_PLAYER_IS_FREE_AIMING_AT(Player player, Entity *entity) // 2975C866E6713290 8866D9D0
	dude10 = Citizen.InvokeNative(0x2975C866E6713290, dude5, Citizen.PointerValueInt(), Citizen.ResultAsString(dude10))
	dude12 = GetEntityModel(dude10)
	dude16 = GetEntityCoords(dude10)
	  isMission = IsEntityAMissionEntity(dude10)
	  isPed = IsEntityAPed(dude10)
	  isAnObj = IsEntityAnObject(dude10)
	  isVeh = IsEntityAVehicle(dude10)
	  object_to_net = ObjToNet(dude10)
	  net_to_object = NetToObj(dude10)   
	    if isMission ~=0 then
            SetEntityAsMissionEntity(dude10, true, true)
			  if isPed ~=false then
			  --BOOL GET_ENTITY_PLAYER_IS_FREE_AIMING_AT(Player player, Entity *entity) // 2975C866E6713290 8866D9D0
			  dude10 = Citizen.InvokeNative(0x2975C866E6713290, dude5, Citizen.PointerValueInt(), Citizen.ResultAsString(dude10))
			  isMission = IsEntityAMissionEntity(dude10)
			   SetEntityAsMissionEntity(dude10, true, true)
			    delPedCoords = GetEntityCoords(dude10)
				 delPedModel = GetEntityModel(dude10)
				 DeleteEntity(dude10)
				  TriggerServerEvent('deleteGunActivity', pedDeleted, tostring(delPedCoords), delPedModel)
				 SetModelAsNoLongerNeeded(dude12)
			  end
              if isVeh ~=false then
			  --BOOL GET_ENTITY_PLAYER_IS_FREE_AIMING_AT(Player player, Entity *entity) // 2975C866E6713290 8866D9D0
			  dude10 = Citizen.InvokeNative(0x2975C866E6713290, dude5, Citizen.PointerValueInt(), Citizen.ResultAsString(dude10))
			  isMission = IsEntityAMissionEntity(dude10)
			   SetEntityAsMissionEntity(dude10, true, true)
			    delVehCoords = GetEntityCoords(dude10)
				 delVehModel = GetEntityModel(dude10)
			    DeleteVehicle(dude10)
				DeleteEntity(dude10)
				 SetModelAsNoLongerNeeded(dude12)
			  end
			  if isAnObj ~=false then
			  --BOOL GET_ENTITY_PLAYER_IS_FREE_AIMING_AT(Player player, Entity *entity) // 2975C866E6713290 8866D9D0
			  dude10 = Citizen.InvokeNative(0x2975C866E6713290, dude5, Citizen.PointerValueInt(), Citizen.ResultAsString(dude10))
			  isMission = IsEntityAMissionEntity(dude10)
			    SetEntityAsMissionEntity(object_to_net, true, true)
				 SetEntityAsMissionEntity(net_to_object, true, true)
				 object_to_net = ObjToNet(dude10)
				  net_to_object = NetToObj(object_to_net)
				   playerName = GetPlayerName(object_to_net, dude5, true)
			    objIndex = GetObjectIndexFromEntityIndex(dude10)
                    objCoords = GetEntityCoords(dude10)
                    objModel = 	GetEntityModel(dude10)
				DeleteEntity(object_to_net)
                 DeleteEntity(net_to_object)
				 SetModelAsNoLongerNeeded(dude12)				    
			  end		  
        end		
	 end
  end
end)

    SetSwimMultiplierForPlayer(dude5, 1.49)
	SetRunSprintMultiplierForPlayer(dude5, 1.49) 

--------------------------------------------------------------------------------------------------
----------------------this gets a player if they are not the current player-----------------------
--------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
     temp0 = GetPlayerPed(-1)
     temp1 = 0
	 while temp1 <=5 do
	  Wait(1000)
      temp2 = IntToPlayerindex(temp1)
	   if GetPlayerPed(temp2) ~= temp0 then 
	        
	   end	
	   if DoesEntityExist(GetPlayerPed(temp2)) then 
	    name =  GetPlayerName(temp2)
	   else 
	   name = GetPlayerName(temp2)
	   end	   
	  temp1 = temp1+1
	  --Citizen.Trace("temp1: "..tostring(temp1))
	  --Citizen.Trace("player ped id: "..tostring(NetworkGetPlayerIndexFromPed(PlayerPedId())))
	  --Citizen.Trace("get player ped: "..tostring(temp0))
	  --Citizen.Trace("int to player index: "..tostring(temp2))
	  --Citizen.Trace("player name: "..tostring(name))
	  if temp1 >= 5 then 
	    temp1 = 0
	  end
	 end   
end)

Citizen.CreateThread(function()
    while true do	
     Citizen.Wait(1000)
	 Citizen.Trace("get hash key of cinscreen: "..tostring(GetHashKey("cinscreen")))
	 --Citizen.Trace("is interior ready: "..tostring(IsInteriorReady(258561)))
	 --Citizen.Trace("playerId: "..tostring(PlayerId()))
	 --Citizen.Trace("get name of this thread: "..tostring(GetIdOfThisThread()))
	 --Citizen.Trace("Player position: "..tostring(GetEntityCoords(GetPlayerPed(PlayerId()))))
	 --Citizen.Trace("player rotation: "..tostring(GetEntityRotation(GetPlayerPed(PlayerId()))))
	 --Citizen.Trace("player ped id: "..tostring(NetworkGetPlayerIndexFromPed(PlayerPedId())))
	 --Citizen.Trace("get player ped: "..tostring(temp0))
	 --Citizen.Trace("int to player index: "..tostring(temp2))
	 --Citizen.Trace("temp1: "..tostring(temp1))
	 Citizen.Trace("spawned entity ID: "..tostring(a))
	 --Citizen.Trace("interior ready: "..tostring(IsInteriorReady(258561)))
	 Citizen.Trace("get closest object of type: "..tostring(GetClosestObjectOfType(GetEntityCoords(GetPlayerPed(PlayerId()), true), 20.1, stuff, 0, 0, 0)))
	--Citizen.Trace("get network id of player: "..tostring(NetworkGetNetworkIdFromEntity(GetPlayerPed())))
	 --Citizen.Trace("current interior ID: "..tostring(GetInteriorFromEntity(GetPlayerPed(-1))))
	 Citizen.Trace("spawned entity coords: "..tostring(GetEntityCoords(a)))
	 Citizen.Trace("spawned entity heading: "..tostring(GetEntityHeading(a)))
	 Citizen.Trace("spawned entity rotation: "..tostring(GetEntityRotation(a)))      
	 Citizen.Trace("spawned entityID : "..tostring(a))
	 --Citizen.Trace("get render cam : "..tostring(renderCam))
	 --Citizen.Trace("spawned vehID : "..tostring(spawnedVeh))
	 --Citizen.Trace("has veh model loaded : "..tostring(HasModelLoaded(veh)))
	 --Citizen.Trace("spawned pedID : "..tostring(spawnPed))
	 --Citizen.Trace("does cam exist : "..tostring(DoesCamExist(26379945)))
	 --Citizen.Trace("closest entity of type: "..tostring(closestEntity))
	 --Citizen.Trace("entity roomKey: "..tostring(entityRoomKey))
	 --Citizen.Trace("entity interiorID: "..tostring(entityInteriorID))
	 --Citizen.Trace("bunker interiorID: "..tostring(bunkerInterior))	 
	 --Citizen.Trace("net to ped playerped: "..tostring(PlayerId()))
	 --Citizen.Trace("playerped: "..tostring(GetPlayerPed(PlayerId())))
	 --Citizen.Trace("interior groupID: "..tostring(interiorGroupID))
	 --Citizen.Trace("spawned entity visible: "..tostring(IsEntityVisible(a)))
	 --Citizen.Trace("spawned veh visible: "..tostring(IsEntityVisible(spawnedVeh)))
	 --Citizen.Trace("spawned ped visible: "..tostring(IsEntityVisible(spawnPed)))
     --Citizen.Trace("spawned ped variations: "..tostring(pedVariationCount))
	 --Citizen.Trace("spawned ped current variation: "..tostring(pedVariation))
	 --Citizen.Trace("spawned ped current  drawable variation: "..tostring(pedDrawableVariation))
	 --Citizen.Trace("spawned ped number of drawable variation: "..tostring(numberOfDrawableVariations))
	 --Citizen.Trace("closest pedCount: "..tostring(closestPedCount))
	 --Citizen.Trace("closest ped: "..tostring(closestPed))
	 --Citizen.Trace("closest veh: "..tostring(closestVeh))
	 --Citizen.Trace("nearby ped count: "..tostring(pedCount))
	 --Citizen.Trace("nearby peds: "..tostring(pedz))
	 --Citizen.Trace("get closest veh(buggyB): "..tostring(GetClosestVehicle(887.824, -3236.251, -98.8946, 1.0, -769147461, 70)))
     --Citizen.Trace("get closest veh(buggyA): "..tostring(GetClosestVehicle(890.708, -3236.804, -98.8961, 50.0, -769147461, 70)))
end
end)



