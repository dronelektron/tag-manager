static GlobalForward g_onAdded;
static GlobalForward g_onRemoved;

void Forward_Create() {
    g_onAdded = new GlobalForward("TagManager_OnAdded", ET_Ignore, Param_Cell, Param_Cell, Param_String);
    g_onRemoved = new GlobalForward("TagManager_OnRemoved", ET_Ignore, Param_Cell, Param_Cell, Param_String);
}

void Forward_OnAdded(int client, int target, const char[] tag) {
    OnAction(g_onAdded, client, target, tag);
}

void Forward_OnRemoved(int client, int target, const char[] tag) {
    OnAction(g_onRemoved, client, target, tag);
}

static void OnAction(GlobalForward callback, int client, int target, const char[] tag) {
    Call_StartForward(callback);
    Call_PushCell(client);
    Call_PushCell(target);
    Call_PushString(tag);
    Call_Finish();
}
