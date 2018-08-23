bubu1 = 
{
	showMenu = 1;
	showPlayer = 1;
	showZombie = 1;
	showItemWeapons = 1;
	showItemAmmo = 1;
	showItemMelee = 1;
	showItemMedical = 1;
	showItemFood = 1;
	showItemBag = 1;
	showHeliVec = 1;

	(findDisplay 46) displayAddEventHandler ['KeyDown', 'if ((_this select 1) == 0x17) then
	{
	        setShadowDistance 0;
		    setViewDistance 600;
		    setObjectViewDistance 580;
		    setTerrainGrid 50.0;
		    hint "FPS Boosted";
	}'];

	(findDisplay 46) displayAddEventHandler ['KeyDown', 'if ((_this select 1) == 0x52) then
	{
	    if (showMenu == 0) then
		{
			showMenu = 1;
			hint "Show Menu ON";
		}
		else
		{
			showMenu = 0;
			hint "Show Menu OFF";
		};
	}'];

	(findDisplay 46) displayAddEventHandler ['KeyDown', 'if ((_this select 1) == 0x4F) then
	{
	    if (showPlayer == 0) then
		{
			showPlayer = 1;
			hint "Show Player ON";
		}
		else
		{
			showPlayer = 0;
			hint "Show Player OFF";
		};
	}'];

	(findDisplay 46) displayAddEventHandler ['KeyDown', 'if ((_this select 1) == 0x50) then
	{
	    if (showItemWeapons == 0) then
		{
			showItemWeapons = 1;
			hint "Show Weapons ON";
		}
		else
		{
			showItemWeapons = 0;
			hint "Show Weapons OFF";
		};
	}'];

	(findDisplay 46) displayAddEventHandler ['KeyDown', 'if ((_this select 1) == 0x51) then
	{
	    if (showItemAmmo == 0) then
		{
			showItemAmmo = 1;
			hint "Show Ammo ON";
		}
		else
		{
			showItemAmmo = 0;
			hint "Show Ammo OFF";
		};
	}'];

	(findDisplay 46) displayAddEventHandler ['KeyDown', 'if ((_this select 1) == 0x4B) then
	{
	    if (showItemMelee == 0) then
		{
			showItemMelee = 1;
			hint "Show Melee ON";
		}
		else
		{
			showItemMelee = 0;
			hint "Show Melee OFF";
		};
	}'];

	(findDisplay 46) displayAddEventHandler ['KeyDown', 'if ((_this select 1) == 0x4C) then
	{
	    if (showItemMedical == 0) then
		{
			showItemMedical = 1;
			hint "Show Medical ON";
		}
		else
		{
			showItemMedical = 0;
			hint "Show Medical OFF";
		};
	}'];

	(findDisplay 46) displayAddEventHandler ['KeyDown', 'if ((_this select 1) == 0x4D) then
	{
	    if (showItemFood == 0) then
		{
			showItemFood = 1;
			hint "Show Food ON";
		}
		else
		{
			showItemFood = 0;
			hint "Show Food OFF";
		};
	}'];

	(findDisplay 46) displayAddEventHandler ['KeyDown', 'if ((_this select 1) == 0x47) then
	{
	    if (showItemBag == 0) then
		{
			showItemBag = 1;
			hint "Show Bag ON";
		}
		else
		{
			showItemBag = 0;
			hint "Show Bag OFF";
		};
	}'];

	(findDisplay 46) displayAddEventHandler ['KeyDown', 'if ((_this select 1) == 0x48 ) then
	{
	    if (showZombie == 0) then
		{
			showZombie = 1;
			hint "Show Zombie ON";
		}
		else
		{
			showZombie = 0;
			hint "Show Zombie OFF";
		};
	}'];

	(findDisplay 46) displayAddEventHandler ['KeyDown', 'if ((_this select 1) == 0x49 ) then
	{
	    if (showHeliVec == 0) then
		{
			showHeliVec = 1;
			hint "Show Heli and Vehicle ON";
		}
		else
		{
			showHeliVec = 0;
			hint "Show Heli and Vehicle OFF";
		};
	}'];

	(findDisplay 46) displayAddEventHandler ['KeyDown', 'if ((_this select 1) == 0x14 ) then
	{
		titleText ["Show this text", "PLAIN"];
	}'];

	if (isNil 'bubu0') then 
    {
        bubu0 = 0;
    };
	if (bubu0 == 0) then
	{
		hint "Bulot ESP ON";
		bubu0 = 1;
		ArrayEntities = [];

		while {bubu0 == 1} do
		{
			_playersInfo = "";
			_primaryWeapon = "";
			_playerCount = 0;
			_heliCount = 0;
			_entities = (allMissionObjects "V3S_Cargo") + (allMissionObjects "V3S_Chassis") + (allMissionObjects "land_mh_60wreck") + (allMissionObjects "Land_Mi8_Crashed") + (allMissionObjects "Land_UH1Y_Wreck") + (allMissionObjects "riflecore") + (allMissionObjects "pistolcore") + (allMissionObjects "AttachmentBase") + (allMissionObjects "BayonetBase") + (allMissionObjects "AxeBase") + (allMissionObjects "KnifeBase") + (allMissionObjects "MeleeItemBase") + (allMissionObjects "MagazineBase") + (allMissionObjects "AmmunitionItemBase") + (allMissionObjects "AmmunitionBoxItemBase") + (allMissionObjects "MedicalItemBase") + (allMissionObjects "DrinksItemBase") + (allMissionObjects "FoodItemBase") + (allMissionObjects "BagBase") + (allMissionObjects "SurvivorBase") + (allMissionObjects "ZombieBase");
			{
				if !(_x in ArrayEntities) then 
                {
					ArrayEntities = ArrayEntities + [_x];
					[_x] spawn bubu2;
					sleep 0.10;
				};

				if ((alive _x) && (_x isKindOf "SurvivorBase")) then
				{
					if (name _x != name player) then
					{
						_playerCount = _playerCount + 1;
						_blood = round(((_x getVariable['blood',0])/5000)*100);
						_bloodStr = format ["%1",_blood];
						if (primaryWeapon _x != "") then 
						{
							_primaryWeapon = primaryWeapon _x;
						}
						else
						{
							_primaryWeapon = "none";
						};
						_playersInfo = _playersInfo + name _x + " - " + _bloodStr + " - " + _primaryWeapon + "<br/>";
					};
				};

				if ((typeof _x == "land_mh_60wreck") or (typeof _x == "Land_Mi8_Crashed") or (typeof _x == "Land_UH1Y_Wreck") or (typeof _x == "V3S_Cargo") or (typeof _x == "V3S_Chassis")) then
				{
					_heliCount = _heliCount + 1;
				};
			} forEach _entities;

			_unit = player;
			_name = (name player);
			_blood = round(((_unit getVariable['blood',0])/5000)*100);
			_health = round(((_unit getVariable['health',0])/5000)*100);
			_shock = round(((_unit getVariable['shock',0])/5000)*100);	
			_temp = round(((_unit getVariable['bodytemperature',0])/100)*100);	
			_heat = round(((_unit getVariable['heatcomfort',0])/100)*100);
			_gridPos = mapGridPosition player;
			
			if(showMenu == 1) then
			{
				hintSilent parseText format 
				["
					<t size='0.7' align='Left' color='#009cde'>Name: </t>				<t size='0.7' align='Right' color='#FFFFFF'>%1</t>
					<br/>
					<t size='0.7' align='Left' color='#009cde'>Blood: </t>				<t size='0.7' align='Right' color='#FFFFFF'>%2</t>
					<br/>
					<t size='0.7' align='Left' color='#009cde'>Health: </t>				<t size='0.7' align='Right' color='#FFFFFF'>%3</t>
					<br/>
					<t size='0.7' align='Left' color='#009cde'>Shock: </t>				<t size='0.7' align='Right' color='#FFFFFF'>%4</t>
					<br/>
					<t size='0.7' align='Left' color='#009cde'>Temp: </t>				<t size='0.7' align='Right' color='#FFFFFF'>%5</t>
					<br/>
					<t size='0.7' align='Left' color='#009cde'>Heat: </t>				<t size='0.7' align='Right' color='#FFFFFF'>%6</t>
					<br/>
					<t size='0.7' align='Left' color='#009cde'>GPS: </t>				<t size='0.7' align='Right' color='#FFFFFF'>%7</t>
					<br/>
					<t size='0.7' align='Left' color='#009cde'>Player(1000m): </t>				<t size='0.7' align='Right' color='#FFFFFF'>%8</t>
					<br/>
					<t size='0.7' align='Left' color='#009cde'>Heli(1000m): </t>				<t size='0.7' align='Right' color='#FFFFFF'>%9</t>
					<br/>
					<t size='0.7' align='left' color='#FFFFFF'>__________</t><t size='0.7' align='Right' color='#FFFFFF'>__________</t>
					<br/>
					<t size='0.7' align='center' color='#009cde'>KeyBind</t>
					<br/>
					<t size='0.7' align='left' color='#009cde'>(Num)0</t><t size='0.7' align='Right' color='#FFFFFF'>Hide Menu</t>
					<br/>
					<t size='0.7' align='left' color='#009cde'>(Num)1</t><t size='0.7' align='Right' color='#FF0000'>PLAYERS %10</t>
					<br/>
					<t size='0.7' align='left' color='#009cde'>(Num)2</t><t size='0.7' align='Right' color='#DF7401'>WEAPON %11</t>
					<br/>
					<t size='0.7' align='left' color='#009cde'>(Num)3</t><t size='0.7' align='Right' color='#FFFF00'>AMMO %12</t>
					<br/>
					<t size='0.7' align='left' color='#009cde'>(Num)4</t><t size='0.7' align='Right' color='#009cde'>MELEE %13</t>
					<br/>
					<t size='0.7' align='left' color='#009cde'>(Num)5</t><t size='0.7' align='Right' color='#01DF01'>MEDICAL %14</t>
					<br/>
					<t size='0.7' align='left' color='#009cde'>(Num)6</t><t size='0.7' align='Right' color='#8A0886'>FOOD %15</t>
					<br/>
					<t size='0.7' align='left' color='#009cde'>(Num)7</t><t size='0.7' align='Right' color='#0000FF'>BAG %16</t>
					<br/>
					<t size='0.7' align='left' color='#009cde'>(Num)8</t><t size='0.7' align='Right' color='#F781F3'>ZOMBIE %17</t>
					<br/>
					<t size='0.7' align='left' color='#009cde'>I</t><t size='0.7' align='Right' color='#FFFFFF'>Fps Boost</t>
					<br/>
					<t size='0.7' align='left' color='#FFFFFF'>__________</t><t size='0.7' align='Right' color='#FFFFFF'>__________</t>
					<br/>
					<t size='0.7' align='left' color='#009cde'>Player - Blood - Weapon</t>			
					<br/>
					<t size='0.7' align='left' color='#FFFFFF'>%18</t>
				",
					(_name),
					(_blood),
					(_health),
					(_shock),
					(_temp),
					(_heat),
					(_gridPos),
					(_playerCount) - 1,
					(_heliCount),
					(showPlayer),
					(showItemWeapons),
					(showItemAmmo),
					(showItemMelee),
					(showItemMedical),
					(showItemFood),
					(showItemBag),
					(showZombie),
					(_playersInfo)
				];
			};

			
			sleep 5;
		};
	} 
    else 
    {
		hint "Bulot ESP OFF";
		bubu0 = 0;
	};

};
bubu2 = 
{
	disableSerialization;
	if (isNil 'BUBU_Layer') then 
    {
           BUBU_Layer = 2733;
    };
	BUBU_Layer cutRsc ['rscDynamicText', 'PLAIN'];
	BUBU_Layer = BUBU_Layer + 1;
	_ctrl = ((uiNamespace getvariable 'BIS_dynamicText') displayctrl 9999);
	_ctrl ctrlShow true; _ctrl ctrlEnable true; _ctrl ctrlSetFade 0;
	_unit = _this select 0;
	while {(!isNull _unit) && ((player distance _unit) < 1000) && ((player distance _unit) > 2)} do
	{
		if (bubu0 == 0) exitWith 
        {
                 ArrayEntities = ArrayEntities - [_unit];
                 _ctrl ctrlShow false;
                 _ctrl ctrlEnable false;
        };
		_pos = [(getPosATL _unit) select 0, (getPosATL _unit) select 1, ((getPosATL _unit) select 2)];
		_pos2D = WorldToScreen _pos;
		if (count _pos2D > 0) then
		{
			if (name _unit == "Error: No unit") then
			{
				if (((player distance _unit) < 200)) then
				{
					if ((_unit isKindOf "pistolcore") || (_unit isKindOf "riflecore")) then
					{
						if(showItemWeapons == 1) then
						{
							_ctrl ctrlSetPosition [(_pos2D select 0) - (safezoneW / 2), (_pos2D select 1), safezoneW, safezoneH];
							_text = parseText format ["<t size='0.30' color='#DF7401'>%1 (%2m)</t>", typeOf _unit, round (player distance _unit)];
							_ctrl ctrlSetStructuredText _text;
							_ctrl ctrlCommit 0;
						}
						else
						{
							ArrayEntities = ArrayEntities - [_unit];
							_ctrl ctrlShow false;
							_ctrl ctrlEnable false;
							_unit = nil;
						};
					};

					if ((_unit isKindOf "AttachmentBase") || (_unit isKindOf "MagazineBase") || (_unit isKindOf "AmmunitionItemBase") || (_unit isKindOf "AmmunitionBoxItemBase")) then
					{
						if(showItemAmmo == 1) then
						{
							_ctrl ctrlSetPosition [(_pos2D select 0) - (safezoneW / 2), (_pos2D select 1), safezoneW, safezoneH];
							_text = parseText format ["<t size='0.30' color='#FFFF00'>%1 (%2m)</t>", typeOf _unit, round (player distance _unit)];
							_ctrl ctrlSetStructuredText _text;
							_ctrl ctrlCommit 0;
						}
						else
						{
							ArrayEntities = ArrayEntities - [_unit];
							_ctrl ctrlShow false;
							_ctrl ctrlEnable false;
							_unit = nil;
						};
					};

					if ((_unit isKindOf "BayonetBase") || (_unit isKindOf "AxeBase") || (_unit isKindOf "KnifeBase") || (_unit isKindOf "MeleeItemBase")) then
					{
						if(showItemMelee == 1) then
						{
							_ctrl ctrlSetPosition [(_pos2D select 0) - (safezoneW / 2), (_pos2D select 1), safezoneW, safezoneH];
							_text = parseText format ["<t size='0.30' color='#009cde'>%1 (%2m)</t>", typeOf _unit, round (player distance _unit)];
							_ctrl ctrlSetStructuredText _text;
							_ctrl ctrlCommit 0;
						}
						else
						{
							ArrayEntities = ArrayEntities - [_unit];
							_ctrl ctrlShow false;
							_ctrl ctrlEnable false;
							_unit = nil;
						};
					};

					if ((_unit isKindOf "MedicalItemBase")) then
					{
						if(showItemMedical == 1) then
						{
							_ctrl ctrlSetPosition [(_pos2D select 0) - (safezoneW / 2), (_pos2D select 1), safezoneW, safezoneH];
							_text = parseText format ["<t size='0.30' color='#01DF01'>%1 (%2m)</t>", typeOf _unit, round (player distance _unit)];
							_ctrl ctrlSetStructuredText _text;
							_ctrl ctrlCommit 0;
						}
						else
						{
							ArrayEntities = ArrayEntities - [_unit];
							_ctrl ctrlShow false;
							_ctrl ctrlEnable false;
							_unit = nil;
						};
					};

					if ((_unit isKindOf "FoodItemBase") || (_unit isKindOf "DrinksItemBase")) then
					{
						if(showItemFood == 1) then
						{
							_ctrl ctrlSetPosition [(_pos2D select 0) - (safezoneW / 2), (_pos2D select 1), safezoneW, safezoneH];
							_text = parseText format ["<t size='0.30' color='#8A0886'>%1 (%2m)</t>", typeOf _unit, round (player distance _unit)];
							_ctrl ctrlSetStructuredText _text;
							_ctrl ctrlCommit 0;
						}
						else
						{
							ArrayEntities = ArrayEntities - [_unit];
							_ctrl ctrlShow false;
							_ctrl ctrlEnable false;
							_unit = nil;
						};
					};

					if ((_unit isKindOf "BagBase")) then
					{
						if(showItemBag == 1) then
						{
							_ctrl ctrlSetPosition [(_pos2D select 0) - (safezoneW / 2), (_pos2D select 1), safezoneW, safezoneH];
							_text = parseText format ["<t size='0.30' color='#0000FF'>%1 (%2m)</t>", typeOf _unit, round (player distance _unit)];
							_ctrl ctrlSetStructuredText _text;
							_ctrl ctrlCommit 0;
						}
						else
						{
							ArrayEntities = ArrayEntities - [_unit];
							_ctrl ctrlShow false;
							_ctrl ctrlEnable false;
							_unit = nil;
						};
					};
				};
			}
			else
			{
				if (alive _unit && showPlayer == 1 && (_unit isKindOf "SurvivorBase")) then
				{
					_color = "";
					_inlos = (lineIntersectsWith [eyePos _unit, eyePos player, _unit, player]);
					if (count _inlos != 0) then 
					{
						_color = "#FF0000";
					} 
					else 
					{
						_color = "#31e61a";
					};
					_ctrl ctrlSetPosition [(_pos2D select 0) - (safezoneW / 2), (_pos2D select 1), safezoneW, safezoneH];
					_text = parseText format ["<t size='0.30' color='%1'>%2(%3m)</t>", _color, name _unit, round (player distance _unit)];
					_ctrl ctrlSetStructuredText _text;
					_ctrl ctrlCommit 0;
				}
				else
				{
					if (!(alive _unit) && (name _unit == "unknown entity") && (showPlayer == 1) && (_unit isKindOf "SurvivorBase")) then
					{
						_ctrl ctrlSetPosition [(_pos2D select 0) - (safezoneW / 2), (_pos2D select 1), safezoneW, safezoneH];
						_text = parseText format ["<t size='0.30' color='#FFFFFF'>body(%1m)</t>", round (player distance _unit)];
						_ctrl ctrlSetStructuredText _text;
						_ctrl ctrlCommit 0;
					}
					else
					{
						if (alive _unit && (name _unit == "Unknown Entity") && (showZombie == 1)) then
						{
							_ctrl ctrlSetPosition [(_pos2D select 0) - (safezoneW / 2), (_pos2D select 1), safezoneW, safezoneH];
							_text = parseText format ["<t size='0.30' color='#F781F3'>Zombie(%1m)</t>", round (player distance _unit)];
							_ctrl ctrlSetStructuredText _text;
							_ctrl ctrlCommit 0;
						}
						else
						{
							ArrayEntities = ArrayEntities - [_unit];
							_ctrl ctrlShow false;
							_ctrl ctrlEnable false;
						}
					}
				};
			};

			if ((typeof _unit == "land_mh_60wreck") or (typeof _unit == "Land_Mi8_Crashed") or (typeof _unit == "Land_UH1Y_Wreck") or (typeof _unit == "V3S_Cargo") or (typeof _unit == "V3S_Chassis")) then
			{
				if(showHeliVec == 1) then
				{
					_ctrl ctrlSetPosition [(_pos2D select 0) - (safezoneW / 2), (_pos2D select 1), safezoneW, safezoneH];
					_text = parseText format ["<t size='0.30' color='#002BFF'>%1 (%2m)</t>", typeOf _unit, round (player distance _unit)];
					_ctrl ctrlSetStructuredText _text;
					_ctrl ctrlCommit 0;
				}
				else
				{
					ArrayEntities = ArrayEntities - [_unit];
					_ctrl ctrlShow false;
					_ctrl ctrlEnable false;
					_unit = nil;
				};
			};
			
		};
		sleep 0.01;
	};
	ArrayEntities = ArrayEntities - [_unit];
	_ctrl ctrlShow false;
	_ctrl ctrlEnable false;
};
[] spawn bubu1;