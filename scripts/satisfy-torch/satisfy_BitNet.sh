#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="${1:-$HOME/BitNet}"
PY_SITE="$PREFIX/lib/python3.13/site-packages"
BACKUP_DIR="$REPO_DIR/.backup_no_torch_$(date +%s)"

echo "Working in: $REPO_DIR"
cd "$REPO_DIR"

# 1. Backup requirements files
mkdir -p "$BACKUP_DIR"
cp -v requirements.txt "$BACKUP_DIR/" 2>/dev/null || true
cp -v 3rdparty/llama.cpp/requirements.txt "$BACKUP_DIR/" 2>/dev/null || true
echo "Backups saved to $BACKUP_DIR"

# 2. Remove torch lines from any requirements files found
find . -type f -name "requirements*.txt" -o -path "./3rdparty/llama.cpp/requirements.txt" | while read -r>
  if grep -q "torch" "$f"; then
    echo "Patching $f (removing torch entries)"
    # create patched copy then replace
    grep -v -E "^\s*torch\b" "$f" > "$f.tmp" || true
    mv "$f.tmp" "$f"
  fi
done

# 3. Install core python deps without torch
echo "Installing Python dependencies (torch excluded)..."
# If repo has top-level requirements.txt
if [ -f requirements.txt ]; then
  grep -v "torch" requirements.txt | python3 -m pip install -r /dev/stdin
fi

# 4. Ensure sentencepiece / gguf etc are present
python3 -m pip install --upgrade setuptools wheel pybind11 || true
python3 -m pip install --upgrade gguf sentencepiece protobuf numpy || true

# 5. Optional: create a minimal torch stub to satisfy imports
STUB="${PY_SITE}/torch.py"
if [ ! -f "$STUB" ]; then
  echo "Creating minimal torch stub at $STUB"
  mkdir -p "$(dirname "$STUB")"
  cat > "$STUB" <<'PY'
# Minimal torch stub for environments without real PyTorch.
# Only used to satisfy import checks. Not for real torch functionality.
class _Dummy:
    def __getattr__(self, name):
        raise ImportError("PyTorch is not installed on this device. This is a stub.")

import types
torch = types.SimpleNamespace()
torch.__version__ = "0+stub"
torch.Tensor = _Dummy
torch.nn = _Dummy
torch.optim = _Dummy
torch.cuda = _Dummy
PY
else
  echo "Torch stub already exists at $STUB"
fi

echo "Done. You can now run BitNet without torch. To revert, restore backups from $BACKUP_DIR."
