void Native_Create() {
    CreateNative("TagManager_IsClientHasTag", IsClientHasTag);
}

static any IsClientHasTag(Handle plugin, int numParams) {
    int client = GetNativeCell(1);
    char tag[TAG_SIZE];

    GetNativeString(2, tag, sizeof(tag));

    return PlayerTagList_Exists(client, tag);
}
