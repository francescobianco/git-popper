# 🎩 git-popper - Minimalistic Side Repo Manager

**git-popper** is a tiny yet powerful command-line tool to manage a secondary repository alongside your main repository. It helps sync specific files and directories, ensuring that critical or sensitive data is stored securely.

---

## ✨ Features

* ✔ **Side Repository Integration** - Attach a secondary repo to your main project.
* ✔ **Selective File Synchronization** - Define specific files or directories via `.gitpopper`.
* ✔ **Prevent Data Loss** - Store sensitive files safely to avoid accidental deletion.
* ✔ **Automated Syncing** - Keep your side repository updated with your workflow.
* ✔ **Centralized Shared Files** - Avoid duplication of common files across projects.

---

## 📦 Installation

To install `git-popper`, copy the script from the `bin` directory and place it in a common executable location:

```sh
sudo cp bin/git-popper /usr/local/bin/
chmod +x /usr/local/bin/git-popper
```

---

## 🛠️ Usage

Create a `.gitpopper` file in your project root:

```ini
## Use as side repo this 
FROM https://github.com/your-side-repo.git

## Store and sync local files into this remote directory of the repo
WORKDIR projects/2025/myproject

## Sync local files into side repo to prevent losing secret files
ADD .env
ADD .secrets
ADD Makefile-dev
```

Run:

```sh
git-popper sync
```

### 🔧 Commands

- 🏷 **`git-popper sync`** - Sync local files with the side repository.
- 📥 **`git-popper pull`** - Fetch the latest changes from the side repository.
- 📤 **`git-popper push`** - Push local updates to the side repository.

---

## ⚠️ Best Practices

Using `git-popper` with `.gitignore` is **crucial** to:

- 🚫 Prevent **sensitive files** from being committed to the main repo.
- 🔒 Keep **environment files** protected while still allowing sync with a dedicated repo.
- 🧹 Maintain **clean repository management** by avoiding clutter.

---

## 🔄 Additional Use Cases

💡 Besides managing `.env` and secret files, `git-popper` can be used to:

* 1️⃣ **Distribute shared scripts** - Store and sync build scripts, CI/CD configs, or utilities without duplication.
* 2️⃣ **Manage development dependencies separately** - Keep local tools in a side repo instead of cluttering the main repo.
* 3️⃣ **Track and sync documentation** - Maintain shared docs across multiple projects while keeping them updated centrally.

---

## 📜 License

📝 This project is licensed under the MIT License.

---

## 🤝 Contributing

Pull requests are welcome! Feel free to fork the repository and submit your improvements.

---

## 👤 Author

[Your Name](https://github.com/yourusername)

