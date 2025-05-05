#if defined _tag_manager_api_included
 #endinput
#endif
#define _tag_manager_api_included

forward void TagManager_OnAdded(int client, int target, const char[] tag);

forward void TagManager_OnRemoved(int client, int target, const char[] tag);

native bool TagManager_Check(int client, const char[] tag);
