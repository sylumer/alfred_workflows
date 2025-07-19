# Scripts for Workflow Inclusion

## Update Resources
Used for downloading folders of content from this site into workflows to keep them updated.

Includes extras and links to other workflows.

- **Note:** Prefab created for inclusion of extras and more resources.
	- Does not include triggers so they will need to be defined as keywords.
		- `CTRL+OPT+CMD+K` will trigger a Keyboard Maestro macro to populate a keyword from clipboard.
			- Keyword
			- Keyword Variable
			- Keyword Label
			- Keyword Description

## Update Workflow
Scripts for:

1. Checking if it is time to check for an update (based on user configured check).
2. Checking for an update (also triggers an update of resources)
	- All workflows using the update mechanism need to also include the resources.
3. Download and install an update from this repo.

- **Note:** `CTRL+OPT+CMD+P` will trigger a Keyboard Maestro macro to populate the frequency check variable in the configuration builder.
- **Note:** Prefab created for this whole mechanism.
