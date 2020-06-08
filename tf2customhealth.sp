#pragma semicolon 1
#pragma newdecls required

#include <sourcemod>
#include <tf2_stocks>
#include <sdkhooks>

#define DEBUG

public Plugin myinfo =
{
	name = "Custom Health Regen",
	author = "zode",
	description = "Changes health regen for rocket jumping.",
	version = "0.1",
};


public void OnClientPutInServer(int client) {
	SDKHook(client, SDKHook_GetMaxHealth, OnGetMaxHealth);
}

public Action OnGetMaxHealth(int client, int &maxhealth) {
	if (TF2_GetPlayerClass(client) == TFClass_Soldier) {
		maxhealth = 900;
	}
	if (TF2_GetPlayerClass(client) == TFClass_DemoMan) {
		maxhealth = 175;
	}
	return Plugin_Handled;
}
