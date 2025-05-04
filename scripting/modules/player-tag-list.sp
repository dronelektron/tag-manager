static ArrayList g_byIndex[MAXPLAYERS + 1];
static StringMap g_bySteam[MAXPLAYERS + 1];

void PlayerTagList_Create() {
    int blockSize = ByteCountToCells(TAG_SIZE);

    for (int client = 1; client <= MaxClients; client++) {
        g_byIndex[client] = new ArrayList(blockSize);
        g_bySteam[client] = new StringMap();
    }
}

void PlayerTagList_Clear(int client) {
    g_byIndex[client].Clear();
    g_bySteam[client].Clear();
}

bool PlayerTagList_Add(int client, const char[] tag) {
    bool result = g_bySteam[client].SetValue(tag, NO_VALUE, REPLACE_NO);

    if (result) {
        g_byIndex[client].PushString(tag);
    }

    return result;
}

bool PlayerTagList_Remove(int client, const char[] tag) {
    bool result = g_bySteam[client].Remove(tag);

    if (result) {
        int index = g_byIndex[client].FindString(tag);

        g_byIndex[client].Erase(index);
    }

    return result;
}

bool PlayerTagList_Exists(int client, const char[] tag) {
    return g_bySteam[client].ContainsKey(tag);
}

void PlayerTagList_Get(int client, int index, char[] tag) {
    g_byIndex[client].GetString(index, tag, TAG_SIZE);
}

int PlayerTagList_Size(int client) {
    return g_byIndex[client].Length;
}
