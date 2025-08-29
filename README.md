# UnrealPluginCreator

[![Ko-Fi](https://img.shields.io/badge/Ko--fi-F16061?style=for-the-badge&logo=ko-fi&logoColor=white)](https://ko-fi.com/minigamedev)
[![Bluesky](https://img.shields.io/badge/Bluesky-0285FF?style=for-the-badge&logo=Bluesky&logoColor=white)](https://bsky.app/profile/minigamedev.bsky.social)
[![Mastodon](https://img.shields.io/badge/-MASTODON-%232B90D9?style=for-the-badge&logo=mastodon&logoColor=white)](https://mastodon.gamedev.place/@minigamedev)
![Unreal Engine](https://img.shields.io/badge/unrealengine-%23313131.svg?style=for-the-badge&logo=unrealengine&logoColor=white)

**UnrealPluginCreator** is a command-line tool that scaffolds Unreal Engine 5+ plugins quickly and efficiently. It creates a fully structured plugin including runtime, editor, and test modules, sets up a Slate-based editor tab, and replaces template placeholders with your plugin's details. Perfect for starting new plugin projects without repetitive boilerplate setup.

---

## Features

- Generates a complete Unreal Engine plugin template.
- Includes:
  - Runtime module
  - Editor module with Slate UI tab
  - Automated test module
  - Wizard-style interactive input or `--defaults` mode for minimal input.
  - Cross-platform support (macOS bash script and Windows batch script).

---

## Installation

Clone this repository:

```bash
git clone https://github.com/<your-username>/UnrealPluginCreator.git
cd UnrealPluginCreator
```

## Usage

### macOS / Linux

```bash
./CreateUnrealPlugin.sh --output-dir <path/to/directory>
```

### Windows

```bat
CreateUnrealPlugin.bat --output-dir <path/to/directory>
```

### Options

| Option               | Description                                                           |
| -------------------- | --------------------------------------------------------------------- |
| `--output-dir <dir>` | Required. Directory where the plugin will be created.                 |
| `--help`             | Show help message.                                                    |
| `--defaults`         | Generate plugin with minimal input (PLUGIN\_NAME and PLUGIN\_AUTHOR). |

### Interactive Wizard

When you run the tool without `--defaults`, you’ll be prompted for:
* Plugin Name (required)
* Plugin Author (required)
* Plugin Description
* Plugin Category
* Plugin Author URL
* Plugin Docs URL
* Plugin Marketplace URL
* Plugin Support URL

Press `Enter` to leave any optional field blank.


## Contributing

Contributions are welcome! Feel free to:
* Submit bug reports or feature requests.
* Fork the repo and submit pull requests.
* Improve template files, add new modules, or enhance cross-platform compatibility.