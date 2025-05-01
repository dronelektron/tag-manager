static StringMap g_tags[MAXPLAYERS + 1];

void PlayerTagList_Create() {
    for (int client = 1; client <= MaxClients; client++) {
        g_tags[client] = new StringMap();
    }
}

void PlayerTagList_Clear(int client) {
    g_tags[client].Clear();
}

bool PlayerTagList_Add(int client, const char[] tag) {
    return g_tags[client].SetValue(tag, NO_VALUE, REPLACE_NO);
}

bool PlayerTagList_Remove(int client, const char[] tag) {
    return g_tags[client].Remove(tag);
}

bool PlayerTagList_Exists(int client, const char[] tag) {
    return g_tags[client].ContainsKey(tag);
}
