static char g_configPath[MAXPLAYERS + 1][PLATFORM_MAX_PATH];

void Storage_CreateDirectory() {
    char configPath[PLATFORM_MAX_PATH];

    BuildPath(Path_SM, configPath, sizeof(configPath), STORAGE_PATH);

    if (DirExists(configPath) || CreateDirectory(configPath, PERMISSIONS)) {
        return;
    }

    Message_UnableToCreateDirectory(configPath);
}

void Storage_BuildPath(int client) {
    char steam[MAX_AUTHID_LENGTH];

    GetClientAuthId(client, AuthId_Steam3, steam, sizeof(steam));
    ReplaceString(steam, sizeof(steam), "[", "");
    ReplaceString(steam, sizeof(steam), "]", "");
    ReplaceString(steam, sizeof(steam), ":", "-");
    BuildPath(Path_SM, g_configPath[client], PLATFORM_MAX_PATH, "%s/%s.txt", STORAGE_PATH, steam);
}

void Storage_SaveTags(int client) {
    int tagsAmount = PlayerTagList_Size(client);

    if (tagsAmount == 0) {
        DeleteFile(g_configPath[client]);

        return;
    }

    File file = GetConfig(client, "w");

    if (file == null) {
        return;
    }

    char tag[TAG_SIZE];

    for (int i = 0; i < tagsAmount; i++) {
        PlayerTagList_Get(client, i, tag);

        file.WriteLine(tag);
    }

    CloseHandle(file);
}

void Storage_LoadTags(int client) {
    PlayerTagList_Clear(client);

    if (!FileExists(g_configPath[client])) {
        return;
    }

    File file = GetConfig(client, "r");

    if (file == null) {
        return;
    }

    char tag[TAG_SIZE];

    while (file.ReadLine(tag, sizeof(tag))) {
        TrimString(tag);

        if (IsEmptyString(tag)) {
            continue;
        }

        PlayerTagList_Add(client, tag);
    }

    CloseHandle(file);
}

static File GetConfig(int client, const char[] mode) {
    File file = OpenFile(g_configPath[client], mode);

    if (file == null) {
        Message_UnableToOpenConfig(g_configPath[client], mode);
    }

    return file;
}

static bool IsEmptyString(const char[] text) {
    return text[0] == '\0';
}
