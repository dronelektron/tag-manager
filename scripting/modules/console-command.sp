void Command_Create() {
    RegAdminCmd(COMMAND_TAG_ADD, OnAddTag, ADMFLAG_GENERIC);
    RegAdminCmd(COMMAND_TAG_REMOVE, OnRemoveTag, ADMFLAG_GENERIC);
    RegAdminCmd(COMMAND_TAG_CHECK, OnCheckTag, ADMFLAG_GENERIC);
}

static Action OnAddTag(int client, int args) {
    if (args < 2) {
        Message_AddTagUsage(client);

        return Plugin_Handled;
    }

    char name[MAX_NAME_LENGTH];
    char tag[TAG_SIZE];

    GetCmdArg(1, name, sizeof(name));
    GetCmdArg(2, tag, sizeof(tag));

    int target = FindTarget(client, name);

    if (target == INVALID_INDEX) {
        Message_PlayerNotFound(client);

        return Plugin_Handled;
    }

    UseCase_AddTag(client, target, tag);

    return Plugin_Handled;
}

static Action OnRemoveTag(int client, int args) {
    if (args < 2) {
        Message_RemoveTagUsage(client);

        return Plugin_Handled;
    }

    char name[MAX_NAME_LENGTH];
    char tag[TAG_SIZE];

    GetCmdArg(1, name, sizeof(name));
    GetCmdArg(2, tag, sizeof(tag));

    int target = FindTarget(client, name);

    if (target == INVALID_INDEX) {
        Message_PlayerNotFound(client);

        return Plugin_Handled;
    }

    UseCase_RemoveTag(client, target, tag);

    return Plugin_Handled;
}

static Action OnCheckTag(int client, int args) {
    if (args < 2) {
        Message_CheckTagUsage(client);

        return Plugin_Handled;
    }

    char name[MAX_NAME_LENGTH];
    char tag[TAG_SIZE];

    GetCmdArg(1, name, sizeof(name));
    GetCmdArg(2, tag, sizeof(tag));

    int target = FindTarget(client, name);

    if (target == INVALID_INDEX) {
        Message_PlayerNotFound(client);

        return Plugin_Handled;
    }

    UseCase_CheckTag(client, target, tag);

    return Plugin_Handled;
}
