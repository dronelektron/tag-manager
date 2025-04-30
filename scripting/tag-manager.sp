#include <sourcemod>

#include "tag-manager/console-command"
#include "tag-manager/message"
#include "tag-manager/player-tag-list"
#include "tag-manager/use-case"

#include "modules/console-command.sp"
#include "modules/message.sp"
#include "modules/player-tag-list.sp"
#include "modules/use-case.sp"

public Plugin myinfo = {
    name = "Tag manager",
    author = "Dron-elektron",
    description = "Allows you to manage player tags",
    version = "0.1.0",
    url = "https://github.com/dronelektron/tag-manager"
};

public void OnPluginStart() {
    Command_Create();
    PlayerTagList_Create();
    LoadTranslations("tag-manager.phrases");
}

public void OnClientConnected(int client) {
    PlayerTagList_Clear(client);
}
