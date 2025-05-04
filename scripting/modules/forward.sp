static GlobalForward g_onTagAdded;
static GlobalForward g_onTagRemoved;

void Forward_Create() {
    g_onTagAdded = new GlobalForward("TagManager_OnTagAdded", ET_Ignore, Param_Cell, Param_Cell, Param_String);
    g_onTagRemoved = new GlobalForward("TagManager_OnTagRemoved", ET_Ignore, Param_Cell, Param_Cell, Param_String);
}

void Forward_OnTagAdded(int client, int target, const char[] tag) {
    OnTagAction(g_onTagAdded, client, target, tag);
}

void Forward_OnTagRemoved(int client, int target, const char[] tag) {
    OnTagAction(g_onTagRemoved, client, target, tag);
}

static void OnTagAction(GlobalForward callback, int client, int target, const char[] tag) {
    Call_StartForward(callback);
    Call_PushCell(client);
    Call_PushCell(target);
    Call_PushString(tag);
    Call_Finish();
}
