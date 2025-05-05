# Tag manager

Allows you to manage player tags:

* Add
* Remove
* Check

### Supported Games

* Day of Defeat: Source

### Requirements

* [SourceMod](https://www.sourcemod.net) 1.11 or later

### Installation

* Download latest [release](https://github.com/dronelektron/tag-manager/releases)
* Extract `plugins` folder to `addons/sourcemod` folder of your server

### Console Commands

* sm_tagmanager_add &lt;#userid|name&gt; &lt;tag&gt; - Add tag for player
* sm_tagmanager_remove &lt;#userid|name&gt; &lt;tag&gt; - Remove tag for player
* sm_tagmanager_check &lt;#userid|name&gt; &lt;tag&gt; - Check tag for player

### API

Called when the `client` has added the `tag` for the `target`

```sourcepawn
forward void TagManager_OnAdded(int client, int target, const char[] tag);
```

Called when the `client` has removed the `tag` for the `target`

```sourcepawn
forward void TagManager_OnRemoved(int client, int target, const char[] tag);
```

Checks if the `client` has the `tag`

```sourcepawn
native bool TagManager_Check(int client, const char[] tag);
```
