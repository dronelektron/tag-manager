#if defined _tag_manager_api_included
 #endinput
#endif
#define _tag_manager_api_included

forward void TagManager_OnTagAdded(int client, int target, const char[] tag);

forward void TagManager_OnTagRemoved(int client, int target, const char[] tag);

native bool TagManager_IsClientHasTag(int client, const char[] tag);
