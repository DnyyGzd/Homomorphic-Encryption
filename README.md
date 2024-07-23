# Homomorphic-Encryption

## Setup

```shell
wget https://raw.githubusercontent.com/DnyyGzd/Homomorphic-Encryption/main/setup.bash
bash setup.bash
```

Add to ~/.bashrc at the end the following content (replace path/to/).
```
export PYTHONPATH=path/to/openfhe-python/build:$PYTHONPATH
```

## VSCode Pylance

Create a directory named .vscode within the project directory and generate a settings.json file containing the following content  (replace path/to/).
```json
{
    "python.analysis.extraPaths": [
        "path/to/stubs"
    ],
    "python.autoComplete.extraPaths": [
        "path/to/stubs"
    ]
}
```
