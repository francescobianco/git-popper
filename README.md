<div align="center">
  <h1>🎩 git-popper</h1>
  <p><strong>Minimalist Side Repository Manager</strong></p>
  <p>
    <a href="https://github.com/yourusername/git-popper/stargazers"><img src="https://img.shields.io/github/stars/yourusername/git-popper" alt="Stars"></a>
    <a href="https://github.com/yourusername/git-popper/issues"><img src="https://img.shields.io/github/issues/yourusername/git-popper" alt="Issues"></a>
    <a href="https://github.com/yourusername/git-popper/blob/main/LICENSE"><img src="https://img.shields.io/github/license/yourusername/git-popper" alt="License"></a>
    <a href="https://github.com/yourusername/git-popper/releases"><img src="https://img.shields.io/github/v/release/yourusername/git-popper" alt="Release"></a>
  </p>
</div>

**git-popper** is a lightweight yet powerful command-line tool for managing a secondary repository alongside your main repository. It helps synchronize specific files and directories, ensuring that critical or sensitive data is stored securely while maintaining seamless workflow integration.

## ✨ Features

* **Side Repository Integration** - Connect a secondary repository to your main project
* **Selective Synchronization** - Define specific files or directories via `.gitpopper`
* **Data Loss Prevention** - Store sensitive files securely to prevent accidental deletion
* **Automated Syncing** - Keep your side repository updated with your workflow
* **Centralized Shared Files** - Avoid duplication of common files across projects

## 📦 Installation

### Quick Install (Recommended)

Install git-popper instantly with a single command:

```sh
curl -fsSL https://raw.githubusercontent.com/yourusername/git-popper/main/bin/git-popper | sudo tee /usr/local/bin/git-popper > /dev/null && sudo chmod +x /usr/local/bin/git-popper
```

Or, for local user installation (no sudo required):

```sh
mkdir -p ~/.local/bin
curl -fsSL https://raw.githubusercontent.com/yourusername/git-popper/main/bin/git-popper -o ~/.local/bin/git-popper && chmod +x ~/.local/bin/git-popper
# Then add ~/.local/bin to your PATH if not already
```

### Manual Installation

If you've already cloned the repository:

```sh
sudo cp bin/git-popper /usr/local/bin/
sudo chmod +x /usr/local/bin/git-popper
```

### Package Managers

Coming soon!

## 🛠️ Usage

Create a `.gitpopper` file in your project root:

```ini
## Use this as side repository
FROM https://github.com/your-side-repo.git

## Store and sync local files into this remote directory of the repository
WORKDIR projects/2025/myproject

## Sync local files into side repo to prevent losing secret files
ADD .env
ADD .secrets
ADD Makefile-dev
```

Execute:

```sh
git-popper sync
```

### 🔧 Commands

- **`git-popper sync`** - Synchronize local files with the side repository
- **`git-popper pull`** - Fetch the latest changes from the side repository
- **`git-popper push`** - Push local updates to the side repository
- **`git-popper status`** - Check synchronization status between local and side repository

## ⚠️ Best Practices

Using `git-popper` in conjunction with `.gitignore` is **essential** for:

- Preventing **sensitive files** from being committed to the main repository
- Keeping **environment files** protected while still allowing synchronization with a dedicated repository
- Ensuring **clean repository management** by avoiding clutter

## 🔄 Additional Use Cases

Beyond managing `.env` and secret files, `git-popper` can be leveraged for:

1. **Distributing shared scripts** - Store and synchronize build scripts, CI/CD configurations, or utilities without duplication
2. **Managing development dependencies separately** - Maintain local tools in a side repository instead of bloating the main repository
3. **Tracking and synchronizing documentation** - Maintain shared documents across multiple projects while updating them centrally

## 🚀 Performance

git-popper is designed to be lightweight with minimal dependencies, ensuring:

- Fast synchronization even with large files
- Low memory footprint
- Efficient operation on CI/CD pipelines and resource-constrained environments

## 📜 License

This project is released under the MIT License. See the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. Check out our [contribution guidelines](CONTRIBUTING.md) for more information.

## 🔍 Roadmap

- [ ] Support for multiple side repositories
- [ ] Web interface for repository management
- [ ] Integration with popular CI/CD platforms
- [ ] Advanced conflict resolution

## 👤 Author

[Francesco Bianco](https://github.com/francescobianco)