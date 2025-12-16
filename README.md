# ComfyUI by IO-AtelierTech

> One-command AI workflow automation for creative professionals

No configuration. No GPU required. Just `just start` and create.

## What You Get

- ✅ **ComfyUI** pre-configured with curated plugins
- ✅ **Cloud GPU inference** via fal.ai (no local GPU needed)
- ✅ **AI workflow assistant** via Claude Code MCP
- ✅ **Video generation** Luma, Kling, FLUX models ready to use
- ✅ **Project-scoped** all data stays in your project folder

## Quick Start

```bash
# 1. Install just (one-time setup)
curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash

# 2. Clone this template
git clone https://github.com/io-ateliertech/comfyui-template.git my-project
cd my-project

# 3. Add your fal.ai API key
cp .env.example .env
nano .env  # Add your FAL_KEY from https://fal.ai/dashboard/keys

# 4. Start ComfyUI
just start
```

Visit **http://localhost:8188**

## Commands

```bash
just start    # Start ComfyUI (pulls Docker image if needed)
just stop     # Stop ComfyUI
just logs     # View logs
just restart  # Restart ComfyUI
just update   # Update to latest version
just status   # Check status
```

## Directory Structure

```
my-project/
├── data/
│   ├── input/         # Put your input images here
│   ├── output/        # Generated content saved here
│   └── models/        # Downloaded models cached here
├── workflows-api/     # API format workflows (for MCP/automation)
├── workflows-ui/      # UI format workflows (load in ComfyUI editor)
├── .env               # Your API keys (gitignored)
└── docker-compose.yml # Docker configuration
```

## For Creatives: What This Does

### No GPU Needed
All AI processing runs on fal.ai cloud GPUs. Your computer just runs the interface.

### Pre-configured Plugins
- **FLUX**: High-quality image generation
- **Luma**: Image-to-video with camera control
- **FFmpeg**: Video processing
- **Text overlays**: Add text to images

### AI Assistant Integration
Install the MCP server to let Claude Code create workflows for you:

```bash
just install-mcp
```

Then copy `.mcp.json` to your Claude Code project config.

## Workflows

### Saving Workflows

In ComfyUI:
1. Create your workflow
2. **Settings → Export (API Format)** → Save to `workflows-api/`
3. **Settings → Save** → Save to `workflows-ui/`

### Using Workflows

- **API format**: Use with Claude Code MCP for automation
- **UI format**: Load in ComfyUI editor for visual editing

## Examples

### Generate an Image

1. Open http://localhost:8188
2. Find "FluxDev_fal" node (Right-click → Add Node → image/fal)
3. Add prompt: "a futuristic city at sunset"
4. Click "Queue Prompt"
5. Find output in `data/output/`

### Image to Video

1. Put image in `data/input/my-image.jpg`
2. Load image node
3. Connect to "LumaImageToVideo_fal"
4. Add camera motion with "LumaConceptsNode"
5. Generate video → saved to `data/output/video/`

## Requirements

- **Docker** - [Install Docker](https://docs.docker.com/get-docker/)
- **just** - [Install just](https://just.systems/man/en/)
- **fal.ai API key** - [Get key](https://fal.ai/dashboard/keys)

## Updating

```bash
just update
```

Pulls the latest Docker image with updated plugins and models.

## Troubleshooting

### ComfyUI won't start

```bash
just logs  # Check for errors
```

Common issues:
- `.env` file missing or invalid FAL_KEY
- Port 8188 already in use

### Models not loading

The first time you use a model, it downloads to `data/models/`. This can take time depending on model size.

### Out of memory errors

Close other applications or increase Docker's memory limit:
- Docker Desktop → Settings → Resources → Memory

## What's Inside the Docker Image?

The `ioateliertech/comfyui-bundle` image includes:
- ComfyUI (latest stable)
- GenAI Connectors (fal.ai, Replicate support planned)
- Video Utils (FFmpeg integration)
- Community plugins (FFmpeg, Text Overlay, Custom Scripts)

Built from: [comfyui-bundle](https://github.com/io-ateliertech/comfyui-bundle)

## Getting Help

- [ComfyUI Documentation](https://docs.comfy.org/)
- [fal.ai Models](https://fal.ai/models)
- [Issues](https://github.com/io-ateliertech/comfyui-template/issues)

## Related Projects

| Project | Purpose |
|---------|---------|
| [comfyui-bundle](https://github.com/io-ateliertech/comfyui-bundle) | Docker image source code |
| [comfyui-mcp](https://github.com/io-ateliertech/comfyui-mcp) | MCP server for Claude Code |
| [comfyui-genai-connectors](https://github.com/io-ateliertech/comfyui-genai-connectors) | Multi-vendor AI connectors |
| [comfyui-video-utils](https://github.com/io-ateliertech/comfyui-video-utils) | Video processing nodes |

## License

MIT License

---

**Made with ❤️ by IO-AtelierTech for creative professionals**
