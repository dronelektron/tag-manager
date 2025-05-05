void UseCase_AddTag(int client, int target, const char[] tag) {
    if (PlayerTagList_Add(target, tag)) {
        Message_TagAdded(client, target, tag);
        Storage_SaveTags(target);
        Forward_OnAdded(client, target, tag);
    } else {
        Message_PlayerWithTag(client, target, tag);
    }
}

void UseCase_RemoveTag(int client, int target, const char[] tag) {
    if (PlayerTagList_Remove(target, tag)) {
        Message_TagRemoved(client, target, tag);
        Storage_SaveTags(target);
        Forward_OnRemoved(client, target, tag);
    } else {
        Message_PlayerWithoutTag(client, target, tag);
    }
}

void UseCase_CheckTag(int client, int target, const char[] tag) {
    if (PlayerTagList_Exists(target, tag)) {
        Message_PlayerWithTag(client, target, tag);
    } else {
        Message_PlayerWithoutTag(client, target, tag);
    }
}
