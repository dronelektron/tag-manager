void Message_AddTagUsage(int client) {
    ReplyToCommand(client, "%s%s", PREFIX, "Usage: " ... COMMAND_TAG_ADD ... " <#userid|name> <tag>");
}

void Message_RemoveTagUsage(int client) {
    ReplyToCommand(client, "%s%s", PREFIX, "Usage: " ... COMMAND_TAG_REMOVE ... " <#userid|name> <tag>");
}

void Message_CheckTagUsage(int client) {
    ReplyToCommand(client, "%s%s", PREFIX, "Usage: " ... COMMAND_TAG_CHECK ... " <#userid|name> <tag>");
}

void Message_PlayerNotFound(int client) {
    ReplyToCommand(client, "%s%t", PREFIX, "Player not found");
}

void Message_PlayerWithTag(int client, int target, const char[] tag) {
    ReplyToCommand(client, "%s%t", PREFIX, "Player with tag", target, tag);
}

void Message_PlayerWithoutTag(int client, int target, const char[] tag) {
    ReplyToCommand(client, "%s%t", PREFIX, "Player without tag", target, tag);
}

void Message_TagAdded(int client, int target, const char[] tag) {
    ShowActivity2(client, PREFIX, "%t", "Tag added", target, tag);
    LogMessage("\"%L\" added '%s' tag for \"%L\"", client, tag, target);
}

void Message_TagRemoved(int client, int target, const char[] tag) {
    ShowActivity2(client, PREFIX, "%t", "Tag removed", target, tag);
    LogMessage("\"%L\" removed '%s' tag for \"%L\"", client, tag, target);
}

void Message_UnableToCreateDirectory(const char[] path) {
    LogError("Unable to create the '%s' directory", path);
}

void Message_UnableToOpenConfig(const char[] path, const char[] mode) {
    LogError("Unable to open the '%s' config with '%s' mode", path, mode);
}
