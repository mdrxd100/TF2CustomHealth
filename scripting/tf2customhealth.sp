#pragma semicolon 1
#pragma newdecls required

#include <sourcemod>
#include <tf2_stocks>
#include <sdkhooks>

#define DEBUG

public Plugin myinfo = {
	name = "Custom Health Regen",
	author = "zode",
	description = "Changes health regen per class.",
	version = "0.1",
	url = "https://github.com/mdrxd100/TF2CustomHealth"
};


public void OnPluginStart() {
	HookEvent("player_spawn", Event_Spawn);
}

public void Event_Spawn(Handle event, const char[] name, bool dontBroadcast) {
	int client = GetClientOfUserId(GetEventInt(event, "userid"));
	SDKUnhook(client, SDKHook_GetMaxHealth, OnGetMaxHealth);
	SDKHook(client, SDKHook_GetMaxHealth, OnGetMaxHealth);
}

public Action OnGetMaxHealth(int client, int &maxhealth) {
	if (TF2_GetPlayerClass(client) == TFClass_Scout) {
		maxhealth = 125;
		SetEntityHealth(client, 125);
	}
	if (TF2_GetPlayerClass(client) == TFClass_Soldier) {
		maxhealth = 900;
		SetEntityHealth(client, 900);
	}
	if (TF2_GetPlayerClass(client) == TFClass_Pyro) {
		maxhealth = 175;
		SetEntityHealth(client, 175);
	}
	if (TF2_GetPlayerClass(client) == TFClass_DemoMan) {
		maxhealth = 175;
		SetEntityHealth(client, 175);
	}
	if (TF2_GetPlayerClass(client) == TFClass_Heavy) {
		maxhealth = 300;
		SetEntityHealth(client, 300);
	}
	if (TF2_GetPlayerClass(client) == TFClass_Engineer) {
		maxhealth = 125;
		SetEntityHealth(client, 125);
	}
	if (TF2_GetPlayerClass(client) == TFClass_Medic) {
		maxhealth = 150;
		SetEntityHealth(client, 150);
	}
	if (TF2_GetPlayerClass(client) == TFClass_Sniper) {
		maxhealth = 125;
		SetEntityHealth(client, 125);
	}
	if (TF2_GetPlayerClass(client) == TFClass_Spy) {
		maxhealth = 125;
		SetEntityHealth(client, 125);
	}
	return Plugin_Handled;
}
