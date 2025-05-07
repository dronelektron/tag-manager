#include <sourcemod>

#include "tag-manager/message"
#include "tag-manager/player-tag-list"
#include "tag-manager/storage"
#include "tag-manager/use-case"

#include "modules/console-command.sp"
#include "modules/forward.sp"
#include "modules/message.sp"
#include "modules/native.sp"
#include "modules/player-tag-list.sp"
#include "modules/storage.sp"
#include "modules/use-case.sp"

public Plugin myinfo = {
    name = "Tag manager",
    author = "Dron-elektron",
    description = "Allows you to manage player tags",
    version = "0.2.1",
    url = "https://github.com/dronelektron/tag-manager"
};

public APLRes AskPluginLoad2(Handle plugin, bool late, char[] error, int errorMax) {
    Native_Create();

    return APLRes_Success;
}

public void OnPluginStart() {
    Command_Create();
    Forward_Create();
    PlayerTagList_Create();
    Storage_CreateDirectory();
    LoadTranslations("common.phrases");
    LoadTranslations("tag-manager.phrases");
}

public void OnClientPostAdminCheck(int client) {
    Storage_BuildPath(client);
    Storage_LoadTags(client);
}
