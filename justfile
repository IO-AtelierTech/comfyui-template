# ComfyUI by IO-AtelierTech
# One-command workflow automation for creatives

# Show available commands
default:
    @just --list

# Start ComfyUI (pulls image if needed)
start:
    #!/usr/bin/env bash
    set -euxo pipefail

    # Check for .env file
    if [ ! -f .env ]; then
        echo "⚠️  No .env file found. Creating from .env.example..."
        if [ -f .env.example ]; then
            cp .env.example .env
            echo "📝 Please edit .env and add your FAL_KEY"
            exit 1
        else
            echo "FAL_KEY=your-fal-api-key-here" > .env
            echo "📝 Please edit .env and add your FAL_KEY from https://fal.ai/dashboard/keys"
            exit 1
        fi
    fi

    # Pull latest image
    docker compose pull

    # Start ComfyUI
    docker compose up -d

    echo ""
    echo "✅ ComfyUI is running!"
    echo "🌐 Open http://localhost:8188"
    echo "📊 View logs: just logs"
    echo "🛑 Stop: just stop"

# Stop ComfyUI
stop:
    docker compose down

# View logs
logs:
    docker compose logs -f comfyui

# Restart ComfyUI
restart:
    just stop
    just start

# Update to latest image
update:
    docker compose pull
    docker compose up -d
    echo "✅ Updated to latest ComfyUI bundle"

# Clean Docker resources (keeps your data)
clean:
    docker compose down
    docker system prune -f

# Install MCP server for Claude Code
install-mcp:
    #!/usr/bin/env bash
    echo "📦 Installing MCP server..."
    uvx --from comfyui-easy-mcp comfy-mcp-server --help
    echo ""
    echo "✅ MCP server installed!"
    echo "📝 Add .mcp.json to your Claude Code project config"

# Check status
status:
    @echo "🔍 ComfyUI Status:"
    @docker compose ps
    @echo ""
    @echo "📦 Docker Images:"
    @docker images | grep -E "(REPOSITORY|comfyui-bundle)" || echo "No ComfyUI images found"
