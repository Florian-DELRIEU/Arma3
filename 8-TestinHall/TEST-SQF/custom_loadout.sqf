hint "hého";

{
current_unit = _x;
systemchat format ["Debut routine pour %1",current_unit];

is_medic = current_unit getVariable "ace_medical_medicclass" !=0;

if (!(current_unit in switchableUnits) && (side current_unit == west)) then {
systemchat "condition vrai";
sleep 1;
	// -- Suppression des medikits
	systemchat "suppression des medikits";
	current_unit removeitems "FirstAidKit";
	current_unit removeitems "MediKit";


sleep 1;
	// -- Chargment classique
	if (true) then {
		systemchat "Chargement commun ...";
		for "_i" from 1 to 5 do {current_unit addItemToUniform "ACE_morphine";};
		for "_i" from 1 to 5 do {current_unit addItemToUniform "ACE_elasticBandage";};
		current_unit addItemToUniform "ACE_Flashlight_KSF1";
		current_unit addItemToUniform "ACE_EarPlugs";
		current_unit addItemToUniform "ACE_MapTools";
		current_unit addItemToUniform "ACE_IR_Strobe_Item";
	};

sleep 1;
	// -- Chargement si medecin
	if (is_medic) then {
		systemchat "Medecin detecté";
		for "_i" from 1 to 20 do {current_unit addItemToBackpack "ACE_elasticBandage";};
		for "_i" from 1 to 20 do {current_unit addItemToBackpack "ACE_packingBandage";};
		for "_i" from 1 to 5 do {current_unit addItemToBackpack "ACE_tourniquet";};
		for "_i" from 1 to 15 do {current_unit addItemToBackpack "ACE_morphine";};
		for "_i" from 1 to 5 do {current_unit addItemToBackpack "ACE_quikclot";};
		current_unit addItemToBackpack "ACE_surgicalKit";
		for "_i" from 1 to 10 do {current_unit addItemToBackpack "ACE_epinephrine";};
		for "_i" from 1 to 5 do {current_unit addItemToBackpack "ACE_adenosine";};
		for "_i" from 1 to 2 do {current_unit addItemToBackpack "ACE_salineIV";};
		for "_i" from 1 to 3 do {current_unit addItemToBackpack "ACE_salineIV_500";};
		for "_i" from 1 to 2 do {current_unit addItemToBackpack "ACE_EarPlugs";};
	};
systemchat "fin de routine";
sleep 1;
};
} foreach allunits;