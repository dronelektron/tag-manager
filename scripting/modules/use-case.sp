void UseCase_AddTag(int client, int target, const char[] tag) {
    if (PlayerTagList_Exists(target, tag)) {
        Message_TagAlreadyAdded(client, target, tag);

        return;
    }

    PlayerTagList_Add(target, tag);
    Message_TagAdded(client, target, tag);
}

void UseCase_RemoveTag(int client, int target, const char[] tag) {
    if (!PlayerTagList_Exists(target, tag)) {
        Message_TagNotFound(client, target, tag);

        return;
    }

    PlayerTagList_Remove(target, tag);
    Message_TagRemoved(client, target, tag);
}
